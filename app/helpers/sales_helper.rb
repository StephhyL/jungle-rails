module SalesHelper
  def active_sale?
    Sale.any?
  end

  def current_active_sale
    Sale.active
  end
end
