class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def search_bar
    @events = Event.search(params[:search])
  end
end