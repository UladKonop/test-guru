# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, except: %i[index new create]

  def index
    @tests = Test.all
  end

  def show; end

  def new; end

  def create
    test = Test.new(test_params)

    if test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
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

  def find_test
    @test = Test.find(params[:id])
  end
end