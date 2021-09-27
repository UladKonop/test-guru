# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :category

  has_many :questions

  has_many :user_tests
  has_many :users, through: :user_tests

  def self.test_titles(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
