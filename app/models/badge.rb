# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :rule_type, presence: true

  RULE_TYPES = %w[category first level].freeze
end
