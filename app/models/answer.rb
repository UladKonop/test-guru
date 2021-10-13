# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :max_answers_amount, on: :create

  private

  def max_answers_amount
    errors.add(:question) if question.answers.size > 4
  end
end
