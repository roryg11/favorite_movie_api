class MoviesController < ApplicationController
  def all
    @movies = Movie.all
    render json: @movies
    #
    # respond_to do |format|
    #   # format.html {render 'all'}
    # end
  end

  def search
    @movies = Movie.all
    if params[:t]
      movie_title = params[:t].capitalize
      @movie = Movie.where("title LIKE ?", "%#{movie_title}%")
      render json: @movie
    elsif params[:y]
      @movie = Movie.where(:year => params[:y])
      render json: @movie
    elsif params[:t] && params[:y]
      @movie = Movie.where(:year => params[:y]) && Movie.where(:title => params[:t])
      render json: @movie
    end
  end

end
