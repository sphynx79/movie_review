class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user
  before_action :job_owner, only: [:edit, :update, :destroy]


  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
   # if user_signed_in? 
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id
    if @review.save
       # flash.now[:success] = 'Comment was successfully created.' 
       set_reviews
    else
       flash.now[:error] = @review.errors.full_messages.to_sentence
    end
    respond_with(@review)
   # else
      # redirect_to  remote_sign_in_path and return
   # end
  end

  # PATCH/PUT /reviews/1
  def update
    respond_to do |format|
      if @review.update(review_params)
        set_reviews
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
        format.js {}
      end
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    set_reviews
    # flash.now[:info] = 'Review was successfully destroyed.'
    respond_with(@review, location: -> { movie_path(@movie) })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

   def set_reviews
     @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
     if @reviews.blank?
            @avg_review = 0
        else
            @avg_review = @reviews.average(:rating).round(2)
      end
   end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      if params["review"]["rating"].blank?
         params["review"]["rating"] = 0
      end
      params.require(:review).permit(:rating, :comment)
    end

    def job_owner
     unless @review.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this Job'
      redirect_to @movie
     end
    end
end
