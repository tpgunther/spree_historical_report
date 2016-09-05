Spree::StockMovement.class_eval do
  after_create :check_out_of_stock

  def check_out_of_stock
    Spree::OutOfStock.check_stock self.stock_item.variant.product
  end

end
