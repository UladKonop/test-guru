# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :set_user, only: :create
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice,
                       :signed_in,
                       first_name: current_user.first_name,
                       last_name: current_user.last_name)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_tests_path
    when User
      tests_path
    end
  end
end
