class HomeController < ApplicationController
  before_action :can_show?, only: [:index]

  def index
  end

end
