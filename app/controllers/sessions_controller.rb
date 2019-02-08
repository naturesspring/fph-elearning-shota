class SessionsController < ApplicationController

    def destroy
        log_out
        flash[:info] = "You are logged out."
        redirect_to root_url
        
       end
       
    def create
        @user = User.find_by(email: params[:session][:email])
    
        if @user && @user.authenticate(params[:session][:password])
          log_in @user
          flash[:success] = "Successfully logged  in!"
          redirect_to @user
        else
          flash[:danger] = "Invalid credentials. Please try again."
          redirect_to login_url
        end
      end
end
