class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :cas_filter
  before_filter :auth_user
  helper_method :current_user

  def cas_filter
    RubyCAS::Filter.filter self
  end

  def auth_user
    flash[:notice] = "Please create a user profile for the site!"
    redirect_to new_users_path unless current_user
  end

  def current_user
     User.find_by_username(session[:cas_user])
  end

  def logout
    RubyCAS::Filter.logout(self)
  end

  @hash = Gmaps4rails.build_markers(@events) do |user, marker|
    marker.lat user.latitude
    marker.lng user.longitude
  end

  def show_events
    @events = Event.sorted
  end

end
