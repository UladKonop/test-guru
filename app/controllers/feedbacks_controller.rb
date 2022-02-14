# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new; end

  def create
    if feedback_params
      FeedbacksMailer.send_feedback(current_user, feedback_params).deliver_now
      redirect_to root_path
    else
      render new_feedback_path
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
