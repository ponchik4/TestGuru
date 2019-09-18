class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit]
  before_action :find_test, only: [:create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
  end

  def create
    question = @test.questions.new(questions_params)
  	    if question.save
  	      render plain: 'Questions was create'
  	    else
  	      redirect_to "/404.html"
  	    end
  end

  def destroy
    @question.destroy
    render plain: "Question was deleted"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
