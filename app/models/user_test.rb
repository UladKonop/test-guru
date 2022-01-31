# frozen_string_literal: true

class UserTest < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_assign_next_question

  def completed?
    question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def rate
    (correct_questions.to_f * 100 / test.questions.count).round(2)
  end

  def passed?
    rate >= SUCCESS_RATE
  end

  def serial_number_of_question
    test.questions.index(question) + 1
  end

  private

  def before_update_assign_next_question
    self.question = next_question
  end

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', question.id).first
  end
end
