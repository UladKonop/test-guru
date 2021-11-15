# frozen_string_literal: true

class UserTestsController < ApplicationController
  before_action :set_user_test, only: %i[show result update]

  def show; end

  def result; end

  def update
    @user_test.accept!(params[:answer_ids])

    if @user_test.completed?
      TestsMailer.completed_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end

  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end
end
