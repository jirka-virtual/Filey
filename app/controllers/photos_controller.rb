class PhotosController < ApplicationController
  def index
  	@albums = Album.all
  	@photos = Photo.where(album_id: nil)
  end

  def list
  	@photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def destroy
  	@photo = Photo.find(params[:id])
  	@photo.destroy
  	redirect_to list_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:doc, :name)
  end
end
