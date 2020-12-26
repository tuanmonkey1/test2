class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def show
    @prices = @product.prices
  end

  def index
    @pagy, @products = pagy(Product.all.order(created_at: :desc))
  end

  private

    def set_product
	  @product = Product.find(params[:id])
    rediect_to root_path if @product.nil?
	end

end
