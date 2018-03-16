class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  def show
    @song = Song.find(params[:id])
  end
  def edit
    @song = Song.find(params[:id])
  end
  def new
    @song = Song.new
  end
  def create
    @song = Song.new(post_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end
  def update
    @song = Song.find(params[:id])
    if @song.update(post_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_url
    end
  private
  def post_params(*arg)
    params.require(:song).permit(*arg)

  end
end
