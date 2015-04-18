module ContactsHelper

  def current_user_email
    @email = "#{session[:cas_user]}@unm.edu"
  end

end
