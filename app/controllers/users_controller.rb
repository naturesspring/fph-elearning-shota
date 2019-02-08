class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def show 
        @user = User.find(params[:id])
    end 
    def create 
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Successfully logged  in!"
          redirect_to root_url
        else
          render "new" 
        end
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_login
        unless logged_in?
          flash[:info] = "Please log in."
          redirect_to login_url
        end
      end



