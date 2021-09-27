# frozen_string_literal: true

class AddCategoriesRefToTest < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :category_id
    add_reference :tests, :category, null: false, foreign_key: true
  end
end
