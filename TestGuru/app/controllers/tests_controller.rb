class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test,  only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    #byebug
    tp = TestPassage.create(test_id: @test.id, current_question_id: @test.questions.first, user_id: current_user.id)
   #current_user.tests(@test)
   redirect_to test_passage_path(tp)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
