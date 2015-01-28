class Purchase < ActiveRecord::Base
  has_many(:products)

  define_method(:total_cost) do
    products().sum("price")
  end

  scope(:between, ->(start_date, end_date) do
    where({ :purchase_date => (start_date..end_date) })
  end)

end
