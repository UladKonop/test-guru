# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :saved_request_url
  before_action :authenticate_user!
  before_action :set_test, only: %i[create new]
  before_action :set_question, except: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.build
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(params[:test_id])
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(params[:test_id])
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
