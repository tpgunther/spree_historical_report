Spree::Variant.class_eval do
  has_many  :out_of_stocks, class_name: "Spree::OutOfStock"

  def has_stock?
   master.in_stock? || variants.any?(&:in_stock?)
  end

end
