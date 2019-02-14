class Admin::CategoriesController < ApplicationController
  def index 
    @categories = Category.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
   
  def new
    @category = Category.new
  end

  def create 
     @category = Category.new(category_params)

        if @category.save
            flash[:success] = "Successfully added category!"
          redirect_to "/admin/categories"
        else
          render "new" 
        end
  end

  def edit
    @category = Category.find(params[:id])

  end

  def update
    @category = Category.find(params[:id])
    flash[:success] = "Successfully edited category!"

    if @category.update(category_params)
        redirect_to "categories_path"
    else
        render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    flash[:success] = "Successfully deleted category!"


    @category.destroy

    redirect_to "categories_path"
  end

  private
  def category_params
    params.require(:category).permit(:title,:description)
  end


end
