class Purchase < ActiveRecord::Base
  has_many(:products)

  define_method(:total_cost) do
    products().sum("price")
  end

end
