class AnswersController < ApplicationController
    def new 
        @category = Category.find(params[:category_id])
        lesson = @category.lessons.order(created_at: :desc).find_by(user_id: current_user) 
        @words = @category.words
        @word = (@category.words - lesson.words).first
        @progress = @words.index(@word)+1
        @choices = @word.choices
        
    end 

    def create
        @category = Category.find(params[:category_id])
        @words = @category.words
        lesson =   @category.lessons.order(created_at: :desc).find_by(user_id: current_user) 
      
        lesson.answers.create!( 
            choice_id: params[:choice_id],
            word_id: params[:word_id]
            )
        
        if  (@category.words - lesson.words).empty?
            redirect_to lesson_path(lesson)
        else
            redirect_to new_category_answer_path
        end


    end 
end
