# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct

      t.timestamps
    end
  end
end
