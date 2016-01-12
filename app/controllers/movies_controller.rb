class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :test ]
  before_filter :set_javascript_vars
  
  
  def test
      @movie = current_user.movies.build
      
      #respond_with(@movies)
      render :partial => "form", :locals => { :movie => @movie }, :layout => false, :status => :created
      # format.json { head :no_content }
      # format.js{ render :layout => false }
      # render nothing: true
  end

  def search
     if params[:search].present?
        @movies = Movie.search(params[:search])
     else
        @movies = Movie.all
     end
  end
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
     @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
     if @reviews.blank?
        @avg_review = 0
     else
        @avg_review = @reviews.average(:rating).round(2)
     end
  end

  # GET /movies/new
  def new
     @movie = current_user.movies.build
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = current_user.movies.build(movie_params)
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
    flash.now[:success] = "Movie was successfully created." if @movie.save
    respond_with(@movies)
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
     
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
        format.js {}
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
    end

    def set_javascript_vars
       to_javascript controller: controller_name.capitalize
    end

end
