class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    #render new product form
  end

  def create
    @products = Product.new(prod_params)
    @products.save
    if !@products.save
      flash[:errors] = @products.errors.full_messages
      redirect_to "/products"
    else
      redirect_to "/products"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(prod_params)
      redirect_to "/products/#{@product.id}"
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to "/products/#{@product.id}/edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user == current_user
      @product.destroy
      redirect_to "/products"
    else
      redirect_to "/products"
    end
  end

  private
    def prod_params
      params.require(:product).permit(:name, :description, :image, :user_id)
    end
end
