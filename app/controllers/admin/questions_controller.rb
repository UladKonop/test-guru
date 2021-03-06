# frozen_string_literal: true

class Admin::QuestionsController < ApplicationController
  before_action :set_test, only: %i[create new]
  before_action :set_question, except: %i[create new]

  after_action :check_questions_amount, only: :destroy

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(params[:test_id])
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(params[:test_id])
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

  def check_questions_amount
    @question.test.update(ready_to_start: false) if @question.test.questions.count.zero?
  end
end
