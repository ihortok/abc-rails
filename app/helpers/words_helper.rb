module WordsHelper
  def letter_path_for(word)
    return admin_dashboard_path if word.starting_letter.blank?

    letter = alphabet.letters.find_by("LOWER(character) = ?", word.starting_letter.downcase)
    return admin_alphabet_letter_path(alphabet, letter) if letter

    admin_dashboard_path
  end
end
