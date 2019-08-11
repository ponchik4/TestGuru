class TestsController < ApplicationController
  before_action :find_test,  only: [:show, :edit]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.user_id = 1
      if @test.save!
        render plain: 'Test was create'
      else
        redirect_to "/404.html"
      end
  end

  def show

  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end
end
