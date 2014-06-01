class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(params[:id]) # look up movie by unique ID Movie.find(:all, :order => params[:id])
    # will render app/views/movies/show.<extension> by default
  end

  def index
    session[:sort] = params[:sort] if params[:sort].present?
    session[:ratings] = params[:ratings] if params[:ratings].present?
    @all_ratings = Movie.ratings
    if (!params[:sort].present? && session[:sort].present?) || (!params[:ratings].present? && session[:ratings].present?)
      session[:redirect] = "redirected"
      flash.keep
      redirect_to movies_path(:sort => session[:sort], :ratings => session[:ratings])
    else
      session[:redirect] = ""
    end
    params[:ratings] = Hash[ @all_ratings.zip( [].fill("1", 0, @all_ratings.size) ) ] if !params[:ratings].present?
    @movies = Movie.where(rating: params[:ratings].keys)
    @movies = @movies.sort_by{ |movie| movie.send(params[:sort]) } if params[:sort].present?
    # session.clear
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
