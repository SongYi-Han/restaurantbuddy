class ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [:edit, :update, :destroy]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render "reviews/new"
      # render "new"
      # render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to restaurant_path(@restaurant.id)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to restaurant_path(@restaurant.id)

  end


  private

  def set_restaurant
     @restaurant = Restaurant.find(params[:restaurant_id])
  end

   def set_review
     @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end


end
