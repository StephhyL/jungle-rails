class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'],
                               password: ENV['ADMIN_PASSWORD']
  def show
    @total_product_count = Product.all.sum(:quantity)
    @total_category_count = Category.all.count
    @total_active_sale_count =
      Sale
        .all
        .where(
          'sales.starts_on <= ? AND sales.ends_on >= ?',
          Date.current,
          Date.current,
        )
        .count
    @total_upcoming_sale_count =
      Sale.all.where('sales.starts_on >=?', Date.current).count
  end
end
