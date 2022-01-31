# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  skip_before_action :authenticate_user!

  before_action :set_test, except: %i[index new create]
  before_action :set_tests, only: %i[index update_inline]

  def index; end

  def show; end

  def new; end

  def create
    test = current_user.created_tests.new(test_params)

    if test.save
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end
end
