class ApplicationController < ActionController::Base
    include SessionsHelper
private 
    def require_login
        unless logged_in?
        flash[:danger] = "You shall not pass!"
        redirect_to login_url
        end
    end 
    
    def admin_user 
        unless current_user.admin?
        flash[:danger] = "You can not access!"
        redirect_to(root_url) 
        end
      end
    
end
