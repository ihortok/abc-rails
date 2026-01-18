module DatabaseSeeds
  class Main
    def self.run
      new.run
    end

    def run
      EnglishAlphabetSeed.new.run
      UkrainianAlphabetSeed.new.run
    end
  end
end
