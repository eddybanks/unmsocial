class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = "User Profile successfully created!"
        redirect_to(:action => 'index')
      else
        render('new')
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        flash[:notice] = "User Profile successfully updated!"
        redirect_to(:action => 'show', :id => @user.id)
      else
        render('edit')
      end
    end

    def delete
      @user = User.find(params[:id])
    end

    def destroy
      user = User.find(params[:id]).destroy
      flash[:notice] = "User Profile successfully deleted!"
      redirect_to(:action => 'index')
    end

    def comments
      @comments = Faqcomments.all
    end
    
    private

      def user_params
        params.require(:user).permit(:username, :fname, :lname, :date_of_birth, :gender, :address, :email, :phone_number, :admin)
      end
end
