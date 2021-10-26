# frozen_string_literal: true

class AddDefaultValueToUserTestsCorrectQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column_default :user_tests, :correct_questions, from: nil, to: 0
  end
end
