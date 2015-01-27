require("spec_helper")

describe(Purchase) do
  it("will return an array of product objects that belong to itself") do
    test_purchase = Purchase.create()
    test_product = Product.create({:name => "Kid bike",:price => 50.00, :purchase_id => test_purchase.id()})
    test_product2 = Product.create({:name => "Coat", :price => 65.25,:purchase_id => test_purchase.id()})
    expect(test_purchase.products()).to(eq([test_product, test_product2]))
  end

end
