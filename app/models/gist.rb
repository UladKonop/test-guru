# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  QUESTION_BODY_LIMIT = 25

  def question_body
    question.body.truncate(QUESTION_BODY_LIMIT, omission: '...')
  end

  def hash
    url.partition('gist.github.com/').last
  end
end
