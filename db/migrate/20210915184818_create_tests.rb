# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :category_id
      t.boolean :ready_to_start, default: false

      t.timestamps
    end
  end
end
