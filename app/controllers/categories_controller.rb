class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    if @category.save
      flash[:success] = "You created #{@category.title}"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Categpry.find(params[:id])
    @category.update(category_params)
    if @company.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

 def category_params
   params.require(:category).permit(:title)
 end
end
