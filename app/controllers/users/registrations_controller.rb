class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super
    current_user.update(about:params[:user][:about],
                              location:params[:user][:location],
                              website:params[:user][:website])
  end

  protected

  def user_params
    params.require(:user).permit(:about, :location, :website)
  end
end