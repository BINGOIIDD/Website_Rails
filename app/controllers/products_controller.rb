class ProductsController < ApplicationController
    
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @q = Product.ransack(params[:q])
        if params[:category_id].present?
            @product = categories
        else
            @product = @q.result(distinct: true).paginate(page: params[:page], per_page: 18)
        end

        @categories = Category.all
    end

    def show
        @product = Product.find(params[:id])
        @categories = Category.all
        @users = User.all
    end

    def new
        @newproduct = Product.new
        @categories = Category.all
    end

    def create
        @newproduct = Product.new(product_params)
        @categories = Category.all
        @newproduct.user_id = current_user.id
        
        if @newproduct.save
            redirect_to @newproduct
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product = Product.find(params[:id])
        @categories = @product.category_id
    end
    
    def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
          redirect_to @product
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    
        redirect_to root_path, status: :see_other
    end

    private

    def categories
        if params[:category_id].present?
            @q.result(distinct: true).where(products: {category_id: params[:category_id]}).paginate(page: params[:page], per_page: 6)
        else
            @q.result(distinct: true).paginate(page: params[:page], per_page: 6)
        end
    end

    def product_params
        params.require(:product).permit(:name, :description, :price, :category_id, :user_id)
    end
    
end
