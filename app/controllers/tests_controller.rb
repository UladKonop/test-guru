# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :saved_request_url
  before_action :authenticate_user!
  before_action :set_test, except: %i[index new create]
  before_action :set_user, only: :start

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

  def start
    current_user.tests.push(@test)
    redirect_to current_user.user_test(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
