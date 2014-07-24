class ApplicationController < ActionController::Base

  protect_from_forgery
  include ApplicationHelper

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :load_index
  def render404
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
    return true
  end

  protected

  def load_index
    @categories = Cliq.where(is_category: true)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation
    end
  end

end
