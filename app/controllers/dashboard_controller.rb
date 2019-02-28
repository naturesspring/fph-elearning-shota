class DashboardController < ApplicationController
    
    def index
       @words = current_user
    end 

    def words 
        @answers = current_user.answers.paginate(page: params[:page], per_page: 10)
        
    end
   
end
