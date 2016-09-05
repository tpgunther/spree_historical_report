Spree::Order.class_eval do

  def check_out_of_stock
    byebug
    self.products.each do |product|
      Spree::OutOfStock.check_stock product
    end
  end

end

Spree::Order.state_machine.after_transition :to => :complete,
                                            :do => :check_out_of_stock
