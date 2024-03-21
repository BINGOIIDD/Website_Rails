class TestQuestionsController < ApplicationController
  before_action :init_user, only: [:edit, :update]

  def new
    @test = TestList.find(params[:test_id])
    @newquestion = TestQuestion.new
    @old_questions = TestQuestion.where(test_list_id: @test.id)
  end
  
  def create
    p = test_question_params
    if p[:answer] == '1'
      p[:answer] = p[:answers_list_1]
    elsif p[:answer] == '2'
      p[:answer] = p[:answers_list_2]
    elsif p[:answer] == '3'
      p[:answer] = p[:answers_list_3]
    elsif p[:answer] == '4'
      p[:answer] = p[:answers_list_4]
    end

    @newquestion = TestQuestion.new(p)

    if @newquestion.save
      if TestQuestion.where(test_list_id: @newquestion.test_list_id).count == 10
        redirect_to test_lists_index_path
      else
        redirect_to new_test_question_path(test_id: @newquestion.test_list_id)
      end
    else
      redirect_to new_test_question_path(test_id: @newquestion.test_list_id)
    end
  end

  def edit
    @question = TestQuestion.find(params[:id])
    @test = TestList.find(@question.test_list_id)
  end

  def update
    @question = TestQuestion.find(params[:id])

    if @question.update(test_question_params)
      redirect_to admin_place_tests_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def test_question_params
    params.require(:test_question).permit(:question, :answers_list_1, :answers_list_2, :answers_list_3, :answers_list_4, :answer, :test_list_id)
  end

  def init_user
    redirect_to(products_path) unless current_user.admin? || current_user.moder? 
  end
end
