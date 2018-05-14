class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:error] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(params[:id])
    render :edit
  end

  def update
    @album = Album.new(album_params)

    if @album.update_attributes
      redirect_to album_url(@album)
    else
      flash[:error] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album.find_by(params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live_album)
  end
end
