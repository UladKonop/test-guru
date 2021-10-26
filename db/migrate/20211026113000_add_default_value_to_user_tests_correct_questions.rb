class AddDefaultValueToUserTestsCorrectQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column_default :user_tests, :correct_questions, 0
  end
end
