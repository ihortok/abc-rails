module DatabaseSeeds
  class BaseSeed
    private

    def attach_picture(word, image_path, image_filename)
      picture = Picture.find_or_initialize_by(title: File.basename(image_filename, File.extname(image_filename)))

      unless picture.picture_file.attached?
        File.open(image_path) do |file|
          picture.picture_file.attach(io: file, filename: image_filename)
          picture.save!
        end
      end

      word.pictures << picture unless word.pictures.exists?(picture.id)
    end
  end
end
