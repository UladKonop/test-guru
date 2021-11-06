# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :set_user, only: :create
  after_action :set_user_id, only: :create

  def new; end

  def create
    if @user&.authenticate(params[:password])
      redirect_to tests_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end

  def set_user_id
    session[:user_id] = @user.id
  end
end
