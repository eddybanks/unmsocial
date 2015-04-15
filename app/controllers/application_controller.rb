class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :cas_filter

  def cas_filter
    RubyCAS::Filter.filter self
  end

  @hash = Gmaps4rails.build_markers(@events) do |user, marker|
    marker.lat user.latitude
    marker.lng user.longitude
  end

  def show_events
    @events = Event.sorted
  end

end
