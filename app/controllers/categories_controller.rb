class CategoriesController < ApplicationController
    before_action :require_login 
    def index 
        @categories = Category.joins(:words).group(:id).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end

    private 
            def require_login
                unless logged_in?
                flash[:danger] = "You shall not pass!"
                redirect_to login_url
                end
            end 
    

end
