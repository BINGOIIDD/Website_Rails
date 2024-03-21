class AdminPlaceController < ApplicationController

  before_action :init_user

  def main
  end

  def users
    @users = User.all
  end

  def test_question_list
    @test = TestList.find(params[:id])
    @questions = TestQuestion.where(test_list_id: @test.id)
  end

  def products
    @q = Product.ransack(params[:q])
    if params[:category_id].present?
        @product = categories
    else
        @product = @q.result(distinct: true).paginate(page: params[:page], per_page: 18)
    end

    @categories = Category.all
  end

  def reviews
    @review = Review.all.paginate(page: params[:page], per_page: 6)
    @product = Product.all
  end

  def categories
    @categories = Category.all
    @products = Product.all
  end

  def tests
    @q = TestList.ransack(params[:q])
    @tests = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    @questions = TestQuestion.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

  def init_user
    redirect_to(products_path) unless current_user.admin? || current_user.moder? 
  end
end
