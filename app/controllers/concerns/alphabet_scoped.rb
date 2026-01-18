module AlphabetScoped
  extend ActiveSupport::Concern

  included do
    helper_method :alphabet
  end

  private

  def alphabet
    @alphabet ||= Alphabet.find(params[:alphabet_id])
  end
end
