# frozen_string_literal: true

class AddNotNullConstaintToQuestionBody < ActiveRecord::Migration[6.1]
  def change
    change_column_null :questions, :body, false
  end
end
