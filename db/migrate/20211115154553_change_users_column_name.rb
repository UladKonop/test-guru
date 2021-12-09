# frozen_string_literal: true

class ChangeUsersColumnName < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :users, :name, :first_name
  end

  def self.down
    rename_column :users, :first_name, :name
  end
end
