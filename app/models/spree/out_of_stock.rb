class Spree::OutOfStock < ActiveRecord::Base
  belongs_to :variant, class_name: 'Spree::Variant'

  def self.check_stock variant
    unless variant.in_stock?
      Spree::OutOfStock.create variant_id: variant.id, date: Date.today
    end
  end

end
