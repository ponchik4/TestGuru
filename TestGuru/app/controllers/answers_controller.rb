class AnswersController < ApplicationController
  before_action :set_question, only: [:new, :create]
  before_action :set_answer, :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = @question.answers.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end
end
