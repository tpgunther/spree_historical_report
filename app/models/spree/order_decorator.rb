Spree::Order.class_eval do

  def say_hello
    puts 'Hello!'
    puts "This order cost #{total}"
    # do something interesting, like notify an external webservice about this order
  end

end

Spree::Order.state_machine.after_transition :to => :complete,
                                            :do => :say_hello
