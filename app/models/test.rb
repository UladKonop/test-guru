# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :category

  has_many :questions, dependent: :destroy

  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  scope :sort_by_category, ->(category) { joins(:category).where(categories: { title: category }) }

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :middle, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: { scope: :title }

  def self.test_titles(category)
    Test.sort_by_category(category).order(title: :desc).pluck(:title)
  end
end
