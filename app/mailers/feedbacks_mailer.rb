# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def send_feedback(user, params)
    @email = user.email
    @title = params[:title]
    @body = params[:body]

    mail to: ENV['ADMIN_EMAIL'], subject: "New feedback: #{@title}"
  end
end
