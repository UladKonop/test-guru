# frozen_string_literal: true

class AddCorrectQuestionsToUserTest < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tests, :correct_questions, :integer
    add_reference :user_tests, :question, foreign_key: true
    change_column_default :user_tests, :correct_questions, from: nil, to: 0
  end
end
