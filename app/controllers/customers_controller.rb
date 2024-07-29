require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repo)
    @customers_repo = customers_repo
    @customers_view = CustomersView.new
  end

  def add
    name = @customers_view.ask_user_for(:name)
    address = @customers_view.ask_user_for(:address)
    customer = Customer.new(name: name, address: address)
    @customers_repo.create(customer)
    list
  end

  def edit
    list
    id = @customers_view.ask_user_for(:id).to_i
    meal = @customers_repo.find(id)
    meal.name = @customers_view.edit(:name, meal.name)
    meal.address = @customers_view.edit(:address, meal.address)
    @customers_repo.save_csv
    list
  end

  def remove
    list
    id = @customers_view.ask_user_for(:id).to_i
    @customers_repo.destroy(id)
    list
  end

  def list
    customers = @customers_repo.all
    @customers_view.list(customers)
  end
end