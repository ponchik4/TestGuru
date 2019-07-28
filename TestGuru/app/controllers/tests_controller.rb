class TestsController < ApplicationController
  before_action :find_test, except: :index

  def index
    render plain: "All tests: #{Test.count}"
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
