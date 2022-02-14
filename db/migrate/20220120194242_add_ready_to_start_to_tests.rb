# frozen_string_literal: true

class AddReadyToStartToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :ready_to_start, :boolean, null: false, default: false
  end
end
