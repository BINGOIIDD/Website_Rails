class CategoriesController < ApplicationController

    before_action :init_user, only: [:edit, :update, :destroy]

    def new
        @category = Category.new
        @categories = Category.all
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to products_path, notice: "Категория успешно создана"
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
    
        if @category.update(category_params)
          redirect_to admin_place_categories_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @products = Product.where(category_id: @category.id)
        @products.each do |product|
            product.category_id = 0
        end
        @category.destroy
        redirect_to root_path, status: :see_other
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

    def init_user
      redirect_to(products_path) unless current_user.admin? || current_user.moder? 
    end
end
