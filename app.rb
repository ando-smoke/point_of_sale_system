require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")
require("pg")

get("/") do
  @products = Product.all()
  erb(:index)
end

post("/products") do
  name = params.fetch("product_name")
  price = params.fetch("product_price").to_f()
  Product.create({:name => name, :price => price})
  @products = Product.all()
  erb(:index)
end
