# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  scope :level, ->(level) { where(level: level) }

  def tests_sort_by_level(level)
    tests.level(level)
  end
end
