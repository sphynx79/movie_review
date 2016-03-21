class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :test ]
  
  def test
   logger.info "############################################"
   respond_to do |format|
      format.html { render :nothing => true, :status => :ok }
      # format.html {}
      format.js   { render :nothing => true, :status => :ok }
   end
  end 

  def search
     if params[:search].present?
        @movies = Movie.search(params[:search])
     else
        @movies = Movie.all
     end
     render "index"
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
    
    #render :partial => "movie", :locals => { :movie => @movie }, :layout => false, :status => :create
    #render nothing: true
    #respond_with(@movies)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
        format.js   { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
        format.js   { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
     
    respond_to do |format|
      if @movie.update(movie_params)
        flash.now[:info] = 'Review was successfully updated.'
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.js   {return render :js => "window.location.href = '#{movie_path(@movie)}'" }
        format.js   {render :format => 'html'}
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
        format.js   { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      flash.now[:info] = 'Movie was successfully destroyed.'
      format.html { redirect_to movies_url }
      format.js {}
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
      params.require(:movie).permit(:title, :description, :movie_length, :director, :image)
    end

end
