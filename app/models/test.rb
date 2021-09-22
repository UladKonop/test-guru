# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :users

  has_many :user_tests
  has_many :users, through: :user_tests

  def self.test_titles(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
