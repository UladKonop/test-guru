# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, except: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.build
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
