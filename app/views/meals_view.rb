require 'readline'

class MealsView
  def list(meals)
    puts 'There are no meals' if meals.empty?
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} ($#{meal.price})"
    end
  end

  def ask_user_for(info)
    puts "What is the meal's #{info}?"
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