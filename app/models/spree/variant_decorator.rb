Spree::Variant.class_eval do
  has_many  :out_of_stocks, class: "Spree::OutOfStock"

end
