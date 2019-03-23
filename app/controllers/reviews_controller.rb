class ReviewsController < ApplicationController

  def create
    # byebug
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(comment_params)
    @review.user_id = current_user.id
    @review.user = current_user
    if @review.save
      redirect_to product_path(@review.product_id)
    else
      redirect_to product_path(@review.product_id), alert: "Please enter a description for your review!"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.user == current_user
      @review.destroy
      redirect_to product_path(@review.product_id)
    else
      redirect_to product_path(@review.product_id)
    end
  end

  private

  def comment_params
    params.require(:review).permit(:description, :rating)
  end
end
