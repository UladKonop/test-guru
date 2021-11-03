# frozen_string_literal: true

class User < ApplicationRecord
  include Auth

  has_many :user_tests
  has_many :tests, through: :user_tests

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  has_secure_password

  def tests_sort_by_level(level)
    tests.level(level)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
