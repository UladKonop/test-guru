# frozen_string_literal: true

class Admin::AnswersController < ApplicationController
  before_action :set_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  after_action :check_answers_amount, only: :destroy

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      @answer.question.test.update!(ready_to_start: true)
      redirect_to admin_answer_path(@answer), notice: 'Answer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), notice: 'Answer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy

    redirect_to admin_question_path(@answer.question)
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def check_answers_amount
    @answer.question.test.update!(ready_to_start: false) if @answer.question.answers.count.zero?
  end
end
