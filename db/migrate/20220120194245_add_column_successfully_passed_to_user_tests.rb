# frozen_string_literal: true

class AddColumnSuccessfullyPassedToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tests, :successfully_passed, :boolean, default: false
  end
end
