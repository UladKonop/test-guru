# frozen_string_literal: true

class AddTestsRefToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
