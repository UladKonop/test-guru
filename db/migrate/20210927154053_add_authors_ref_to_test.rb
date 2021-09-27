# frozen_string_literal: true

class AddAuthorsRefToTest < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, foreign_key: true
  end
end
