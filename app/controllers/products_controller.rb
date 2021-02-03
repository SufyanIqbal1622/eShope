class ProductsController < ApplicationController

  def index
    # @products = Product.all
    @products = Product.all.with_attached_image
  end

  def show
    @prduct = Product.find(params[:id])

  end

end
