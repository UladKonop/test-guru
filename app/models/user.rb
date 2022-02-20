# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :gists

  has_many :user_tests
  has_many :tests, through: :user_tests

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  has_and_belongs_to_many :badges

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_sort_by_level(level)
    tests.level(level)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    instance_of?(Admin)
  end
end
