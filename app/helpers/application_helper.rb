module ApplicationHelper

  def current_user
     session[:cas_user]
  end
  
end
