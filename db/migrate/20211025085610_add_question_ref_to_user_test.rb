# frozen_string_literal: true

class AddQuestionRefToUserTest < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_tests, :question, foreign_key: true
  end
end
