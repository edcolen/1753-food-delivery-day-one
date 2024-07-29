require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repo)
    @meals_repo = meals_repo
    @meals_view = MealsView.new
  end

  def add
    name = @meals_view.ask_user_for(:name)
    price = @meals_view.ask_user_for(:price).to_i
    meal = Meal.new(name: name, price: price)
    @meals_repo.create(meal)
    list
  end

  def edit
    list
    id = @meals_view.ask_user_for(:id).to_i
    meal = @meals_repo.find(id)
    meal.name = @meals_view.edit(:name, meal.name)
    meal.price = @meals_view.edit(:price, meal.price).to_i
    @meals_repo.save_csv
    list
  end

  def remove
    list
    id = @meals_view.ask_user_for(:id).to_i
    @meals_repo.destroy(id)
    list
  end

  def list
    meals = @meals_repo.all
    @meals_view.list(meals)
  end
end