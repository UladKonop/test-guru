# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category

  def self.test_titles(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
