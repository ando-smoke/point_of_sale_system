require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")
require("./lib/purchase")
require("pg")

get("/") do
  erb(:index)
end

get("/cashier") do
  erb(:cashier)
end

get("/manager") do
  @products = Product.all()
  erb(:manager)
end

post("/products") do
  name = params.fetch("product_name")
  price = params.fetch("product_price").to_f()
  Product.create({:name => name, :price => price})
  @products = Product.all()
  erb(:manager)
end

get("/product/:id") do
  @product = Product.find(params.fetch("id").to_i())

  erb(:product)
end

patch("/product/:id/name") do
  name = params.fetch("name")
  @product = Product.find(params.fetch('id').to_i())
  @product.update(name: name)
  erb(:product)
end

patch("/product/:id/price") do
  price = params.fetch("price").to_f()
  @product = Product.find(params.fetch('id').to_i())
  @product.update(price: price)
  erb(:product)
end

delete("/product/:id/delete") do
  @product = Product.find(params.fetch("id").to_i())
  @product.destroy()
  @products = Product.all()
  erb(:manager)
end
