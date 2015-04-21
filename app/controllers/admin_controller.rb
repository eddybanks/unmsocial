class AdminController < ApplicationController

  def index
    @users = User.all
    @events = Event.all
    @groups = Group.all
    @contacts = Contact.all
  end

end
