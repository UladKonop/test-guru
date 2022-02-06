# frozen_string_literal: true

class UserTestsController < ApplicationController
  before_action :set_user_test, only: %i[show result update gist]

  def show
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to), alert: 'No questions present.' unless @user_test.question
  end

  def result; end

  def update
    if params[:answer_ids].nil?
      flash[:alert] = 'Select at least one question'
    else
      @user_test.accept!(params[:answer_ids])
    end

    if @user_test.completed?
      TestsMailer.completed_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      redirect_to user_test_path(@user_test)
    end
  end

  def gist
    gist = GistQuestionService.new(@user_test.question)
    result = gist.call
    flash_options = if gist.success?
                      @user_test.user.gists.create(question: @user_test.question,
                                                   url: result.html_url)
                      { notice: t('.success', url: result[:html_url]) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @user_test, flash_options
  end

  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end
end
