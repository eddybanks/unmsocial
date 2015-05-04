class UsersController < ApplicationController
    skip_before_filter :auth_user
    helper_method :edit

    def index                                          # view all users
      @users = User.all
    end

    def show                                          # show user profile page
      @user = User.find(params[:id])
    end

    def new                                           # form to create new user profile
      @user = User.new
    end

    def create                                          # create a new user profile
      @user = User.new(user_params)
      @user.username = session[:cas_user]               #set the username of the user to the netid provided by cas authentication
      @user.email = session[:cas_user] + "@unm.edu"     #set the email using the netid
      @user.admin = false                               #set the admin status to false for every user/ Can be overwritten by the admin or in the db seed files

      if @user.save
        flash[:notice] = "User Profile successfully created!"
        redirect_to root_path                           #redirect to homepage with flash message after user profile is created
      else
        render('new')                                   #render the same form if user profile fails to save
      end
    end

    def edit                                            # form to edit user profile
      @user = User.find(params[:id])
    end

    def update                                          # save changes to the profile
      @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        flash[:notice] = "User Profile successfully updated!"
        redirect_to(:action => 'show', :id => @user.id)
      else
        render('edit')
      end
    end

    def delete                                           # delete user account confirmation page
      @user = User.find(params[:id])
    end

    def destroy                                           # user profile deletion
      user = User.find(params[:id]).destroy
      flash[:notice] = "User Profile successfully deleted!"
      redirect_to(:action => 'index')
    end

    def comments
      @comments = Faqcomments.all
    end

    private

      def user_params
        params.require(:user).permit(:username, :fname, :lname, :date_of_birth, :gender)
      end
end
