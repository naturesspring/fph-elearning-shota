class AnswersController < ApplicationController
    def new 
        @category = Category.find(params[:category_id])
        @words = @category.words.order(created_at: :desc) 
        @word = @category.words.first
        @choices = @word.choices
    end 

    def create
        Answer.create( 
            choice_id: params[:choice_id],
            word_id: params[:word_id])

        # @category.lessons.find_by(user:current_user)
    end 
end
