class TestResultsController < ApplicationController
    
  before_action :init_user, only: [:destroy]
  before_action :set_param, only: [:new]

  def set_param 
    @id = params[:test_id]
  end

  def index
    @test_list = TestList.find(params[:test_id])
    @results = TestResult.where(test_list_id: params[:test_id]).joins(:user).order('MAX(result) DESC').group('users.id')
    @users = User.all
  end

  def show
    @result = TestResult.find(params[:id])
    @test = TestList.find(@result.test_list_id)
    @test_list = TestQuestion.where(test_list_id: @test.id)
    @users = User.all
  end

  def new
    @newresult = TestResult.new
    @test = TestList.find(@id)
    @users = User.all
    @test_list = TestQuestion.where(test_list_id: @test.id)
  end

  def create
    @newresult = TestResult.new(test_result_params)
    @test = TestList.find(@newresult.test_list_id)
    @users = User.all
    @test_list = TestQuestion.where(test_list_id: @test.id)
    @counter = 0 
    @test_list.each_with_index do |question, question_index|
        case question_index
        when 0
            if @newresult.question1 === question.answer
                @counter += 1
            end
        when 1 
            if @newresult.question2 === question.answer
                @counter += 1
            end
        when 2 
            if @newresult.question3 === question.answer
                @counter += 1
            end
        when 3 
            if @newresult.question4 === question.answer
                @counter += 1
            end
        when 4 
            if @newresult.question5 === question.answer
                @counter += 1
            end
        when 5 
            if @newresult.question6 === question.answer
                @counter += 1
            end
        when 6 
            if @newresult.question7 === question.answer
                @counter += 1
            end
        when 7 
            if @newresult.question8 === question.answer
                @counter += 1
            end
        when 8 
            if @newresult.question9 === question.answer
                @counter += 1
            end
        when 9 
            if @newresult.question10 === question.answer
                @counter += 1
            end
        end
    end
    @newresult.result = @counter * 10
    @newresult.user_id = current_user.id
    if @newresult.save
        redirect_to @newresult
    else
        render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @results = TestResult.find(params[:id])
    @results.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def test_result_params
    params.require(:test_result).permit(:test_list_id, :user_id, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10)
  end

  def init_user
    redirect_to(products_path) unless current_user.admin? || current_user.moder? 
  end
end
