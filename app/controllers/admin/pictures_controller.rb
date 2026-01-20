module Admin
  class PicturesController < BaseController
    before_action :set_picture, only: [ :destroy ]

    def index
      @pictures = Picture.order(:title)
    end

    def new
      @picture = Picture.new
    end

    def create
      @picture = Picture.new(picture_params)

      if @picture.save
        redirect_to admin_pictures_path, notice: "Picture created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @picture.destroy
      redirect_to admin_pictures_path, notice: "Picture deleted."
    end

    private

    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:title, :picture_file)
    end
  end
end
