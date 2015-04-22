class AdminController < ApplicationController

  def index
    if current_user.username == 'eddybanks'
      @users = User.all
      @events = Event.all
      @groups = Group.all
      @contacts = Contact.all
    else
      flash[:notice] = "Not admin user"
      redirect_to root_path
    end
  end

end
