# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.where(ready_to_start: true)
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.user_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
