module DatabaseSeeds
  class UkrainianAlphabetSeed
    LETTERS = %w[а б в г ґ д е є ж з и і ї й к л м н о п р с т у ф х ц ч ш щ ь ю я].freeze
    COLORS = {
      "Червоний" => "Red",
      "Помаранчевий" => "Orange",
      "Жовтий" => "Yellow",
      "Зелений" => "Green",
      "Блакитний" => "Sky Blue",
      "Синій" => "Blue",
      "Фіолетовий" => "Purple",
      "Чорний" => "Black",
      "Білий" => "White",
      "Коричневий" => "Brown",
      "Сірий" => "Gray",
      "Рожевий" => "Pink"
    }.freeze


    def run
      # Create or find the Ukrainian alphabet
      alphabet = Alphabet.find_or_create_by(name: "Ukrainian")

      # Create letters A-Z for the Ukrainian alphabet
      LETTERS.each do |letter|
        alphabet.letters.find_or_create_by(character: letter)
      end

      # Create some words for each letter
      words = {
        "а" => [ "Апельсин", "Ананас", "Антилопа" ],
        "б" => [ "Банан", "Бабуся", "Бджола", "Білий", "Блакитний" ],
        "в" => [ "Ведмідь", "Ваза", "Вітер" ],
        "г" => [ "Гарбуз", "Година", "Гусак" ],
        "ґ" => [ "Ґудзик", "Ґанок", "Ґрунт" ],
        "д" => [ "Дерево", "Дім", "Дорога" ],
        "е" => [ "Екран", "Електрика", "Енергія" ],
        "є" => [ "Єнот", "Єдність", "Єдиноріг" ],
        "ж" => [ "Жирафа", "Жук", "Життя", "Жовтий" ],
        "з" => [ "Зебра", "Зірка", "Зима", "Зелений" ],
        "и" => [], # No common Ukrainian words start with "и"
        "і" => [ "Іграшка", "Інструмент", "Ідея" ],
        "ї" => [ "Їжак", "Їжа", "Їдальня" ],
        "й" => [ "Йогурт", "Йога", "Йод" ],
        "к" => [ "Кіт", "Книга", "Квітка", "Коричневий" ],
        "л" => [ "Лев", "Лампа", "Лист" ],
        "м" => [ "Миша", "Море", "Місто" ],
        "н" => [ "Ніс", "Нота", "Небо" ],
        "о" => [ "Олівець", "Око", "Острів" ],
        "п" => [ "Пес", "Птах", "Пляж", "Помаранчевий" ],
        "р" => [ "Ракета", "Риба", "Рука", "Рожевий" ],
        "с" => [ "Сонце", "Собака", "Стіл", "Синій", "Сірий" ],
        "т" => [ "Тигр", "Трава", "Торт" ],
        "у" => [ "Усмішка", "Урок", "Ураган" ],
        "ф" => [ "Фрукт", "Фонтан", "Фіалка", "Фіолетовий" ],
        "х" => [ "Хатина", "Хліб", "Хмара" ],
        "ц" => [ "Цукор", "Цвіт", "Цирк" ],
        "ч" => [ "Чайка", "Час", "Човен", "Червоний", "Чорний" ],
        "ш" => [ "Шапка", "Школа", "Шоколад" ],
        "щ" => [ "Щука", "Щастя", "Щітка" ],
        "ь" => [], # No words start with the soft sign
        "ю" => [ "Юрба", "Юнак", "Ювелір" ],
        "я" => [ "Яблуко", "Ягода", "Яхта" ]
      }

      words.each do |letter, words|
        words.each do |word|
          word = Word.find_or_create_by(content: word, alphabet: alphabet)

          # Associate colors if the word matches any color names
          if COLORS.keys.include?(word.content)
            color = Color.find_by(name: COLORS[word.content])
            word.colors << color if color
          end
        end
      end
    end
  end
end
