# frozen_string_literal: true

class AddGistsRefToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :gists, :question, foreign_key: true
  end
end
