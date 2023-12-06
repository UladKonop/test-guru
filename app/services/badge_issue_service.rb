# frozen_string_literal: true

class BadgeIssueService
  def initialize(user_test)
    @user_test = user_test
    @current_test = @user_test.test
    @current_user = @user_test.user
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      @current_user.badges.push(badge) if send(badge.rule_type, badge)
    end
  end

  private

  def category(badge)
    success_tests_by_category = passed.sort_by_category(badge.rule_value).uniq.count
    all_tests_by_category = Test.sort_by_category(badge.rule_value).count
    success_tests_by_category == all_tests_by_category && @current_user.badges.exclude?(badge)
  end

  def first(_badge)
    passed_tests = @current_test.user_tests.where(user_id: @current_user.id).count
    @user_test.passed? && passed_tests == 1
  end

  def level(badge)
    success_tests_by_level = passed.level(badge.rule_value).uniq.count
    all_tests_by_level = Test.level(badge.rule_value).count
    success_tests_by_level == all_tests_by_level && @current_user.badges.exclude?(badge)
  end

  def passed
    @current_user.tests.joins(:user_tests).where(user_tests: { successfully_passed: true })
  end
end
