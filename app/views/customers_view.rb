class CustomersView
  def list(customers)
    puts 'There are no customers' if customers.empty?
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} (#{customer.address})"
    end
  end

  def ask_user_for(info)
    puts "What is the customer's #{info}?"
    print '> '
    gets.chomp
  end

  def edit(info, data)
    Readline.pre_input_hook = lambda {
      Readline.insert_text data.to_s
      Readline.redisplay
      Readline.pre_input_hook = nil
    }
    print "#{info}: "
    Readline.readline('', false)
  end
end