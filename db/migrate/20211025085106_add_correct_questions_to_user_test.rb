# frozen_string_literal: true

class AddCorrectQuestionsToUserTest < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tests, :correct_questions, :integer
  end
end
