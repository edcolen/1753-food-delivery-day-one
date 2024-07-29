require_relative 'router'

require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

meals_repo = MealRepository.new(File.join(__dir__, 'data', 'meals.csv'))
meals_controller = MealsController.new(meals_repo)

customers_repo = CustomerRepository.new(File.join(__dir__, 'data', 'customers.csv'))
customers_controller = CustomersController.new(customers_repo)

router = Router.new(meals_controller, customers_controller)

router.run



