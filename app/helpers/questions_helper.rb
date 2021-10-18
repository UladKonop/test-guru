# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    header = question.new_record? ? 'Create New' : 'Edit'
    header << " #{question.body} Question"
  end
end
