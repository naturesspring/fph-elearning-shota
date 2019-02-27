class DashboardController < ApplicationController
    
    def index
       @words = current_user
    end 

   
end
