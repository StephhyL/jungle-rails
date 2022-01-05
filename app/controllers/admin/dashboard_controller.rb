class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'],
                               password: ENV['ADMIN_PASSWORD']
  def show
    @total_product_count = Product.all.sum(:quantity)
    @
  end
end
