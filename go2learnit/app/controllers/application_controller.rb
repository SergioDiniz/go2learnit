class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || user_path
  end


  private

  def can_show?
    if user_signed_in?
      redirect_to user_path
    end
  end

end
