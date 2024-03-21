class UsersController < ApplicationController

  before_action :init_user, only: [:show, :edit, :update, :destroy]

  def index_product
    @product = Product.where(user_id: current_user.id).paginate(page: params[:page], per_page: 6)
  end

  def index_review
    @review = Review.where(user_id: current_user.id).paginate(page: params[:page], per_page: 6)
    @product = Product.all
  end

  def index_test
    @q = TestList.ransack(params[:q])
    @tests = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    @questions = TestQuestion.all
  end

  def show
    @user = User.find(params[:id])
    @role = Role.all
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_place_users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_place_users_path, status: :see_other
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :role_id)
  end

  def init_user
    redirect_to(products_path) unless current_user.admin? || current_user.moder? 
  end
end
