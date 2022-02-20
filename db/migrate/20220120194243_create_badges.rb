# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :picture, default: 'https://picsum.photos/200'
      t.string :rule_type, null: false
      t.string :rule_value, default: ''

      t.timestamps

      t.index :title, unique: true
    end
  end
end
