import { Controller } from "@hotwired/stimulus"

// "Допиши слово": pick the missing letters to finish the word.
//
// The server renders every round (.puzzle target) with blanks ([data-expected])
// and letter tiles ([data-letter]). This controller only shows one round at a
// time and checks each tapped tile against the selected blank. No state is saved.
//
// Texts come from the `messages` value so that copy stays in the view.
const BLANK_EMPTY = [ "border-2", "border-dashed", "border-amber-400", "bg-amber-50" ]
const BLANK_FILLED = [ "bg-green-500", "text-white", "shadow-md", "pop" ]
const BLANK_ACTIVE = [ "ring-4", "ring-amber-300", "bg-white" ]

export default class extends Controller {
  static targets = [ "puzzle", "dot", "message", "elf", "next", "play", "finish" ]
  static values = {
    messages: Object,
    current: { type: Number, default: 0 }
  }

  connect() {
    this.show(0)
  }

  // Tap on an empty blank: choose which blank the next tile goes to.
  select(event) {
    const blank = event.currentTarget
    if (blank.dataset.filled) return

    this.activate(blank)
  }

  // Tap on a letter tile.
  pick(event) {
    const tile = event.currentTarget
    const blank = this.activeBlank
    if (!blank) return

    if (tile.dataset.letter === blank.dataset.expected) {
      this.fill(blank, tile)
    } else {
      this.animate(tile, "shake")
      this.say("wrong")
    }
  }

  next() {
    if (this.currentValue + 1 >= this.puzzleTargets.length) {
      this.finish()
    } else {
      this.show(this.currentValue + 1)
    }
  }

  // Private

  show(index) {
    this.currentValue = index
    this.puzzleTargets.forEach((puzzle, i) => puzzle.classList.toggle("hidden", i !== index))
    this.nextTarget.classList.add("hidden")
    this.activate(this.emptyBlanks[0])
    this.updateDots()
    this.say("start")
  }

  fill(blank, tile) {
    blank.textContent = tile.dataset.letter.toUpperCase()
    blank.dataset.filled = "true"
    blank.disabled = true
    blank.removeAttribute("aria-label")
    blank.classList.remove(...BLANK_EMPTY, ...BLANK_ACTIVE)
    blank.classList.add(...BLANK_FILLED)
    tile.classList.add("hidden")

    const upcoming = this.emptyBlanks[0]
    if (upcoming) {
      this.activate(upcoming)
      this.say("right")
      this.animate(this.elfTarget, "bounce-soft")
    } else {
      this.complete()
    }
  }

  complete() {
    this.activeBlank = null
    this.say("done")
    this.animate(this.elfTarget, "bounce-soft")
    this.nextTarget.classList.remove("hidden")
  }

  finish() {
    this.playTarget.classList.add("hidden")
    this.finishTarget.classList.remove("hidden")
  }

  activate(blank) {
    this.blanks.forEach((other) => other.classList.remove(...BLANK_ACTIVE))
    this.activeBlank = blank || null
    blank?.classList.add(...BLANK_ACTIVE)
  }

  updateDots() {
    this.dotTargets.forEach((dot, i) => {
      dot.classList.toggle("bg-green-500", i < this.currentValue)
      dot.classList.toggle("bg-amber-400", i === this.currentValue)
      dot.classList.toggle("bg-white", i > this.currentValue)
    })
  }

  say(kind) {
    const options = this.messagesValue[kind]
    if (!options?.length) return

    this.messageTarget.textContent = options[Math.floor(Math.random() * options.length)]
  }

  // Replays a CSS animation class, even if it is already running.
  animate(element, className) {
    element.classList.remove(className)
    void element.offsetWidth
    element.classList.add(className)
    element.addEventListener("animationend", () => element.classList.remove(className), { once: true })
  }

  get currentPuzzle() {
    return this.puzzleTargets[this.currentValue]
  }

  get blanks() {
    return [ ...this.currentPuzzle.querySelectorAll("[data-expected]") ]
  }

  get emptyBlanks() {
    return this.blanks.filter((blank) => !blank.dataset.filled)
  }
}
