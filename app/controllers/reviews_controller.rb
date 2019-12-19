class ReviewsController < ApplicationController
   before_action :set_cocktail

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @review.save
    redirect_to cocktails_path(@cocktail)
  end

  def stars
    @rating = Review.select(:rating)
  end

  private

   def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :cocktail_id)
  end

end
