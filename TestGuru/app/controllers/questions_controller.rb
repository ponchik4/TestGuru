class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit]

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
    question = Question.create(question_params)
    render plain: question.inspect
    question.save!
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: resalt.join("/n")
  end

  def delete
  end

  private

  def question_params
    params.require(:question).permit(:title, :question)
  end

  def rescue_with_question_not_found
    render plain: 'question was not found'
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
