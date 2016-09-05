Spree::Variant.class_eval do
  has_many  :out_of_stocks, class_name: "Spree::OutOfStock"

end
