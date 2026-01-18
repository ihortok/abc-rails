module Admin
  class DashboardController < BaseController
    def index
      @alphabets = Alphabet.all
    end
  end
end
