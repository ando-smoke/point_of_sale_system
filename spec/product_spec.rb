require("spec_helper")

describe(Product) do
  it("returns the purchase it belongs to") do
    purchase = Purchase.create()
    product = Product.create({ :name => "Bicycle",
      :price => 350.00, :purchase_id => purchase.id() })
    expect(product.purchase()).to(eq(purchase))
  end
end
