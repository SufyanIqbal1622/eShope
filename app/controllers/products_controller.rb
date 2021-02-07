class ProductsController < ApplicationController

  def index
    @products = Product.all.with_attached_image
  end

  def show
    @prduct = Product.find(params[:id])
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Product.all.where("lower(name) ILIKE :search", search: @parameter)
    end
  end

  private
  def product_params
      params.require(:product).permit(:name, :price)
  end

end
