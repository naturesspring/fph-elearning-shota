class Admin::WordsController < ApplicationController
    def index 
        @category = Category.find(params[:category_id])
        @words = @category.words.order(created_at: :desc) 
    end

    def new 
        @category = Category.find(params[:category_id])
        @word = @category.words.new
        3.times {@word.choices.new}

    end 

    def create 
        @category = Category.find(params[:category_id])
        @word = @category.words.new(word_params)

        if @word.save
            flash[:success] = "Successfully added word!"
          redirect_to admin_category_words_path
        else
          render "new" 
        end
    end

    def edit
        @category = Category.find(params[:category_id])
        @word= @category.words.find(params[:id])
    end
    
      def update
        @category = Category.find(params[:category_id])
        @word= @category.words.find(params[:id])
        flash[:success] = "Successfully edited category!"
    
        if @word.update(word_params)
            redirect_to admin_categories_path
        else
            render "edit"
        end
      end
    
      def destroy
        @category = Category.find(params[:category_id])
        @word= @category.words.find(params[:id])
       
        flash[:success] = "Successfully deleted category!"
    
        @word.destroy
    
        redirect_to admin_category_words_path
      end
    
    private
        def word_params
            params.require(:word).permit(
                :content,
                choices_attributes: [
                    :content, :correct
                ]
            )
        end
   
end
