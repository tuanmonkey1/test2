class ProductsController < ApplicationController
  authorize_resource
  before_action :set_product, only: [:show]

  def show
    @prices = @product.prices
  end

  def index  
      unless params[:q]
        @products = if params[:title]
        Product.search_by_title(params[:title])
          else
            Product.all
          end
          else
            @q = Product.ransack(params[:q])
            @products = @q.result
          end
          respond_to do |format|
          format.html {}
          format.json
          end   
  end

  private

  def set_product
	  @product = Product.find(params[:id])
    rediect_to root_path if @product.nil?
	end

end
