Spree::Order.class_eval do

  def check_out_of_stock
    self.line_items.each do |line_item|
      Spree::OutOfStock.check_stock line_item.variant
    end
  end

end

Spree::Order.state_machine.after_transition :to => :complete,
                                            :do => :check_out_of_stock
