module SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def current_active_sale
    Sale.active
  end
end
