class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def home
    render json: {status: 'ok'}
  end
end
