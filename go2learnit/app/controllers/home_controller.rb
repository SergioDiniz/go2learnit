class HomeController < ApplicationController
  before_action :show_home?, only: [:index]

  def index
  end

  def show_home?
    if user_signed_in?
      redirect_to user_path
    end
  end

end
