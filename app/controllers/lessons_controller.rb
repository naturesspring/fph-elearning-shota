class LessonsController < ApplicationController
    def create 
        @lesson = current_user.lessons.create(category_id: params[:lesson][:category_id])
        redirect_to new_category_answer_url params[:lesson][:category_id]
    end 

    def show
        lesson  = Lesson.find(params[:id])
        @answers = lesson.answers
    end


   
end
