class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit]
  before_action :find_test, only: [:create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: 'All questions'
  end

  def show
    redirect_to root_path
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question
      render plain: 'Questions was create'
    else
      redirect_to "/404.html"
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: resalt.join("/n")
  end

  def destroy
    @question.destroy
    render plain: "Question was deleted"
  end

  private

  def question_params
    params.require(:body).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: '404: question was not found'
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
