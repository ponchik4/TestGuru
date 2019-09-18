class Admin::TestsController < Admin::BaseController

  before_action :set_test,  only: %i[show edit update destroy start]

  def new
    @test = Test.new
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @test.destroy
    redirect_to tests_path
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

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end
end
