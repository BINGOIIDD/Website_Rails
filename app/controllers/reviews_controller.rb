class ReviewsController < ApplicationController

    before_action :authenticate_user!
    
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new(review_params)
        @review.user_id = current_user.id
        @review.save()
        redirect_to product_path(@product)
    end
    
    def destroy
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:product_id])
        @review.destroy
    
        redirect_to root_path, status: :see_other
    end

    private
        def review_params
            params.require(:review).permit(:degnities, :fault, :comment, :score, :user_id)
        end
end
