# frozen_string_literal: true

class User < ApplicationRecord
  def tests(level)
    Test.all.select { |test| test.level == level }
  end
end
