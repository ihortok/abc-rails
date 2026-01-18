module DatabaseSeeds
  class UkrainianAlphabetSeed
    LETTERS = %w[а б в г ґ д е є ж з и і ї й к л м н о п р с т у ф х ц ч ш щ ь ю я].freeze
    WORD_PICTURES_DIR = File.join(__dir__, "files", "word_pictures")
    WORD_SEEDS = {
      "а" => [
        { content: "Апельсин", image: "orange.png" },
        { content: "Ананас", image: "ananas.png" },
        { content: "Антилопа", image: "antelope.png" }
      ],
      "б" => [
        { content: "Банан", image: "banana.png" },
        { content: "Бабуся", image: "grandma.png" },
        { content: "Бджола", image: "bee.png" },
        { content: "Білий", color: "White" },
        { content: "Блакитний", color: "Sky Blue" }
      ],
      "в" => [
        { content: "Ведмідь", image: "bear.png" },
        { content: "Ваза", image: "vase.png" },
        { content: "Вітер", image: "wind.png" }
      ],
      "г" => [
        { content: "Гарбуз", image: "pumpkin.png" },
        { content: "Година" },
        { content: "Гусак", image: "goose.png" }
      ],
      "ґ" => [
        { content: "Ґудзик", image: "button.png" },
        { content: "Ґанок", image: "porch.png" },
        { content: "Ґрунт", image: "soil.png" }
      ],
      "д" => [
        { content: "Дерево", image: "tree.png" },
        { content: "Дім", image: "house.png" },
        { content: "Дорога", image: "road.png" }
      ],
      "е" => [
        { content: "Екран", image: "screen.png" },
        { content: "Електрика", image: "electricity.png" },
        { content: "Енергія", image: "energy.png" }
      ],
      "є" => [
        { content: "Єнот", image: "raccoon.png" },
        { content: "Єдність", image: "unity.png" },
        { content: "Єдиноріг", image: "unicorn.png" }
      ],
      "ж" => [
        { content: "Жирафа", image: "giraffe.png" },
        { content: "Жук", image: "bug.png" },
        { content: "Життя", image: "life.png" },
        { content: "Жовтий", color: "Yellow" }
      ],
      "з" => [
        { content: "Зебра", image: "zebra.png" },
        { content: "Зірка", image: "star.png" },
        { content: "Зима", image: "winter.png" },
        { content: "Зелений", color: "Green" }
      ],
      "и" => [], # No common Ukrainian words start with "и"
      "і" => [
        { content: "Іграшка", image: "toy.png" },
        { content: "Інструмент", image: "tools.png" },
        { content: "Ідея", image: "idea.png" }
      ],
      "ї" => [
        { content: "Їжак", image: "hedgehog.png" },
        { content: "Їжа", image: "food.png" },
        { content: "Їдальня", image: "dining_room.png" }
      ],
      "й" => [
        { content: "Йогурт", image: "yogurt.png" },
        { content: "Йога", image: "yoga.png" },
        { content: "Йод", image: "iodine.png" }
      ],
      "к" => [
        { content: "Кіт", image: "cat.png" },
        { content: "Книга", image: "book.png" },
        { content: "Квітка", image: "flower.PNG" },
        { content: "Коричневий", color: "Brown" }
      ],
      "л" => [
        { content: "Лев", image: "lion.png" },
        { content: "Лампа", image: "lamp.png" },
        { content: "Лист", image: "leaf.png" }
      ],
      "м" => [
        { content: "Миша", image: "mouse.png" },
        { content: "Море" },
        { content: "Місто" }
      ],
      "н" => [
        { content: "Ніс" },
        { content: "Нота" },
        { content: "Небо" }
      ],
      "о" => [
        { content: "Олівець" },
        { content: "Око" },
        { content: "Острів" }
      ],
      "п" => [
        { content: "Пес" },
        { content: "Птах" },
        { content: "Пляж" },
        { content: "Помаранчевий", color: "Orange" }
      ],
      "р" => [
        { content: "Ракета" },
        { content: "Риба" },
        { content: "Рука" },
        { content: "Рожевий", color: "Pink" }
      ],
      "с" => [
        { content: "Сонце" },
        { content: "Собака" },
        { content: "Стіл" },
        { content: "Синій", color: "Blue" },
        { content: "Сірий", color: "Gray" }
      ],
      "т" => [
        { content: "Тигр" },
        { content: "Трава" },
        { content: "Торт" }
      ],
      "у" => [
        { content: "Усмішка" },
        { content: "Урок" },
        { content: "Ураган" }
      ],
      "ф" => [
        { content: "Фрукт" },
        { content: "Фонтан" },
        { content: "Фіалка" },
        { content: "Фіолетовий", color: "Purple" }
      ],
      "х" => [
        { content: "Хатина" },
        { content: "Хліб" },
        { content: "Хмара" }
      ],
      "ц" => [
        { content: "Цукор" },
        { content: "Цвіт" },
        { content: "Цирк" }
      ],
      "ч" => [
        { content: "Чайка" },
        { content: "Час" },
        { content: "Човен" },
        { content: "Червоний", color: "Red" },
        { content: "Чорний", color: "Black" }
      ],
      "ш" => [
        { content: "Шапка" },
        { content: "Школа" },
        { content: "Шоколад" }
      ],
      "щ" => [
        { content: "Щука" },
        { content: "Щастя" },
        { content: "Щітка" }
      ],
      "ь" => [], # No words start with the soft sign
      "ю" => [
        { content: "Юрба" },
        { content: "Юнак" },
        { content: "Ювелір" }
      ],
      "я" => [
        { content: "Яблуко" },
        { content: "Ягода" },
        { content: "Яхта" }
      ]
    }.freeze


    def run
      # Create or find the Ukrainian alphabet
      alphabet = Alphabet.find_or_create_by(name: "Ukrainian")

      # Create letters A-Z for the Ukrainian alphabet
      LETTERS.each_with_index do |letter, index|
        alphabet.letters.find_or_create_by(character: letter, position: index + 1)
      end

      WORD_SEEDS.each do |_letter, word_entries|
        word_entries.each do |word_entry|
          word = Word.find_or_create_by(content: word_entry[:content], alphabet: alphabet)

          if word_entry[:color]
            color = Color.find_by(name: word_entry[:color])
            word.colors << color if color
          end

          image_filename = word_entry[:image]
          next unless image_filename

          image_path = File.join(WORD_PICTURES_DIR, image_filename)
          next if word.image.attached? || !File.exist?(image_path)

          File.open(image_path) do |file|
            word.image.attach(io: file, filename: image_filename)
          end
        end
      end
    end
  end
end
