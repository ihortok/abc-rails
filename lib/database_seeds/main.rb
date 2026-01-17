module DatabaseSeeds
  class Main
    def self.run
      new.run
    end

    def run
      AlphabetsSeed.new.run
    end
  end
end
