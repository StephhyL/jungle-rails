class Admin::SalesController < ApplicationController
  ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'],
                               password: ENV['ADMIN_PASSWORD']

  def index
    @sales = Sale.all
  end

  def new
    @sales = Sale.new
  end
end
