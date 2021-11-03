# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def tests_sort_by_level(level)
    tests.level(level)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
