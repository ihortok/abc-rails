module DatabaseSeeds
  class PicturesSeed
    WORD_PICTURES_DIR = File.join(__dir__, "files", "word_pictures")

    def run
      Dir.children(WORD_PICTURES_DIR).each do |filename|
        next if filename.start_with?(".")

        picture = Picture.find_or_initialize_by(title: File.basename(filename, File.extname(filename)))
        next if picture.picture_file.attached?

        file_path = File.join(WORD_PICTURES_DIR, filename)
        next unless File.exist?(file_path)

        File.open(file_path) do |file|
          picture.picture_file.attach(io: file, filename: filename)
          picture.save!
        end
      end
    end
  end
end
