class TestListsController < ApplicationController
  before_action :init_user, only: [:edit, :update, :show]

  def index
    @q = TestList.ransack(params[:q])
    @tests = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    @questions = TestQuestion.all
  end

  def show
    @test = TestList.find(params[:id])
  end

  def new
    @newtest = TestList.new
  end

  def create
    @newtest = TestList.new(test_list_params)
    @newtest.user_id = current_user.id
    
    if @newtest.save
        redirect_to new_test_question_path(test_id: @newtest.id)
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @test = TestList.find(params[:id])
  end

  def update
    @test = TestList.find(params[:id])

    if @test.update(test_list_params)
      redirect_to admin_place_tests_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @questions = TestQuestion.where(test_list_id: params[:id])
    @questions.destroy_all

    @results = TestResult.where(test_list_id: params[:id])
    @results.destroy_all

    @test = TestList.find(params[:id])
    @test.destroy

    redirect_to users_index_test_path, status: :see_other
  end

  private

  def test_list_params
    params.require(:test_list).permit(:test_name, :user_id)
  end

  def init_user
    redirect_to(products_path) unless current_user.admin? || current_user.moder? 
  end
end
