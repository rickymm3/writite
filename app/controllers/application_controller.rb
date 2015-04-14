class ApplicationController < ActionController::Base

  protect_from_forgery
  include ApplicationHelper
  include CliqsHelper
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def render404
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
    return true
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation
    end
  end

  def edit_permissions(id, tr)
    if id && tr && current_user
      if tr == 'reply'
          x = Reply.find(id)
      elsif tr == 'topic'
          x = Topic.find(id)
      end
    end
    unless current_user.id == x.user_id
      redirect_to "/pages/not_authorized"
    end
  end

end
