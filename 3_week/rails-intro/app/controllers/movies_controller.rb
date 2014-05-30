class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(params[:id]) # look up movie by unique ID Movie.find(:all, :order => params[:id])
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.find(:all, :order => params[:id])
    # @movies = Movie.where(rating: "PG").find(:all, :order => params[:id])
    @all_ratings = Movie.ratings
    @rating_list = params[:ratings]
    # @movies = Movie.find(:all)
    if @rating_list
      @first_if = "first if"
    #   # @movies = Movie.where(rating: @rating_list.keys)
       # @movies = Movie.where(rating: "PG").find(:all, :order => params[:id])
       @movies = Movie.where(rating: params[:ratings].keys).find(:all, :order => session[:sort])#.sort_by{|movie| movie.send(params[:id])}
       return @movies
       # where(rating: params[:ratings]).find(:all, :order => params[:id])
    else
      @rating_list = @all_ratings
    end
    if params[:id]#.find(:all, :order => params[:id])
      # @movies = Movie.find(:all, :order => params[:id])     #   where(rating: params[:ratings]).find(:all, :order => params[:id])
      @movies = @movies.sort_by{|movie| movie.send(params[:id])}
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
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
