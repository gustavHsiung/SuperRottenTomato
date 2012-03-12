class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
   @all_ratings = Movie.all_ratings
   #order
   if Movie.column_names.include?(params[:order])
      hilite_class = params[:order].to_s+'_class'
      puts hilite_class
      instance_variable_set("@#{hilite_class}", :hilite)
   end
   #ratings
   puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>'+params[:ratings].keys.to_s unless params[:ratings].blank?
   select_rating = params[:ratings].blank? ? nil:{:conditions=>{:rating => params[:ratings].keys}}
   puts select_rating.to_s+'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<' unless params[:ratings].blank?
   @movies = Movie.find(:all, :conditions => { :rating => ['PG','R']}, order_by)
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

  def order_by
    return() if params[:order].blank?
    {:order => params[:order]+" ASC"}
  end
end
