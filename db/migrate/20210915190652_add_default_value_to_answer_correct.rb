# frozen_string_literal: true

class AddDefaultValueToAnswerCorrect < ActiveRecord::Migration[6.1]
  def change
    change_column_default :answers, :correct, false
  end
end
