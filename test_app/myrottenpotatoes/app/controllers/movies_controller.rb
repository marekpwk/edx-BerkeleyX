class MoviesController < ApplicationController

  def index
    @movies = Movie.find(:all, :order => "title")

  end

  def show
    # debugger
    # raise params.inspect
    id = params[:id]
    begin
      @movie = Movie.find(id)
    rescue
      flash[:notice] = "The movie with index #{id} doesn't exist"
      redirect_to movies_path
    end
  end

  def new

  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
 end