class Spree::OutOfStock < ActiveRecord::Base
  belongs_to :variant, class_name: 'Spree::Variant'

  def self.hello
    puts "Gem working"
  end

end
