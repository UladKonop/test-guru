# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new; end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
