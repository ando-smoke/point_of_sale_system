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
  @purchase = Purchase.create()
  @products = Product.all()
  erb(:cashier)
end

delete("/purchase_delete/:id") do
  Purchase.find(params.fetch("id").to_i()).destroy()
  erb(:index)
end

patch("/purchase") do
  purchase_id = params.fetch("purchase_id").to_i()
  product_ids = params.fetch("product_ids")

  product_ids.each() do |id|
    Product.find(id.to_i()).update(:purchase_id => purchase_id)
  end

  purchase = Purchase.find(purchase_id)
  @purchase_products = purchase.products()
  @total_cost = purchase.total_cost()
  erb(:purchase)
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
