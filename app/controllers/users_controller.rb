class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def index
        @users = User.all.paginate(page: params[:page], per_page: 10)
    end
    
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

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render "edit"
        end
    end
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
        end
    end

