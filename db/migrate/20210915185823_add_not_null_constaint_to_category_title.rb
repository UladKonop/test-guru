# frozen_string_literal: true

class AddNotNullConstaintToCategoryTitle < ActiveRecord::Migration[6.1]
  def change
    change_column_null :categories, :title, false
  end
end
