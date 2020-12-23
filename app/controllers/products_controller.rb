class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def show
		
  end

  def index
    @pagy, @products = pagy(Product.all.order(created_at: :desc))
  end

  private

    def set_product
	  @product = Product.find(params[:id])
	end

end
