class Admin::DashboardController < ApplicationController
  def show
  end

  private

  def product_list
    @product_list = Product.all
  end
  helper_method :product_list

  def category_list
    @category_list = Category.all
  end
  helper_method :category_list
end
