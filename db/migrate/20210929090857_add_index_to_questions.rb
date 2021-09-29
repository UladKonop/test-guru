# frozen_string_literal: true

class AddIndexToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_index :questions, :body, unique: true
  end
end
