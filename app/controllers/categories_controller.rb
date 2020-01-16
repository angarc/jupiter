class CategoriesController < ApplicationController

  def index
    @category   = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new category_params

    if @category.save
      @categories = Category.all
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update category_params
      flash[:success] = "Successfully updated category"
      redirect_to categories_path
    else
      flash[:danger] = @category.errors.full_messages.to_sentence
      render :edit 
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    @categories = Category.all
    respond_to do |format|
      format.js
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :color)    
    end

end
