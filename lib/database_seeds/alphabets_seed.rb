module DatabaseSeeds
  class AlphabetsSeed
    def run
      puts "Seeding alphabets..."

      Alphabet.find_or_create_by(name: "Latin")
    end
  end
end
