class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    print `clear`
    while @running
      title
      display_options
      action = gets.chomp.to_i
      dispatch(action)
    end
    puts 'Bye!'
  end

  def stop!
    @running = false
  end

  def display_options
    puts ' What do you want to do? '
    puts '1 - List all meals'
    puts '2 - Add a meal'
    puts '3 - Edit a meal'
    puts '4 - Delete a meal'
    puts '5 - List all customers'
    puts '6 - Add a customer'
    puts '7 - Edit a customer'
    puts '8 - Delete a customer'
    puts '0 - Exit'
    print '> '
  end

  def dispatch(action)
    print `clear`
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.remove
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.remove
    when 0 then stop!
    else
      puts 'Invalid option!'
    end
  end

  def title
    puts ''.center(40, '=')
    puts ' Batch #1753 '.center(40, '=')
    puts ''.center(40, '=')
    puts ''
  end
end
