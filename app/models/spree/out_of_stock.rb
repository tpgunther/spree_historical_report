class Spree::OutOfStock < ActiveRecord::Base
  belongs_to :variant, class_name: 'Spree::Variant'

  def self.check_stock product
    unless product.has_stock?
      Spree::OutOfStock.create variant_id: product.master.id, date: Date.today
    end
  end

end
