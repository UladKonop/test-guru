# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :set_user, only: :create
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to session.delete(:return_to) || root_path
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
end
