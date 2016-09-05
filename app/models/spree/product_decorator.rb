Spree::Product.class_eval do

  def has_stock?
   master.in_stock? || variants.any?(&:in_stock?)
  end

end
