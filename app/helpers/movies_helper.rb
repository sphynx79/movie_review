module MoviesHelper
   def movie_review(movie)
      reviews = Review.where(movie_id: movie.id).order("created_at DESC")
      if reviews.blank?
        return 0
      else
        return reviews.average(:rating).round(2)
      end
   end
end
