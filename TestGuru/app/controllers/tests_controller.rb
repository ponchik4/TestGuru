class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test,  only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def start
    @current_user
    redirect_to @current_user.test_passage
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
