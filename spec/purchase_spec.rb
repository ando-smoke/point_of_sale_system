require("spec_helper")

describe(Purchase) do
  it("will return an array of product objects that belong to itself") do
    test_purchase = Purchase.create({ :purchase_date => "2015-01-25" })
    test_product = Product.create({:name => "Kid bike",:price => 50.00, :purchase_id => test_purchase.id()})
    test_product2 = Product.create({:name => "Coat", :price => 65.25,:purchase_id => test_purchase.id()})
    expect(test_purchase.products()).to(eq([test_product, test_product2]))
  end

  describe("#total_cost") do
    it("will return the total of all products in the purchase") do
      test_purchase = Purchase.create({ :purchase_date => "2015-01-25" })
      test_product = Product.create({:name => "Kid bike",:price => 50.00, :purchase_id => test_purchase.id()})
      test_product2 = Product.create({:name => "Coat", :price => 65.25,:purchase_id => test_purchase.id()})
      expect(test_purchase.total_cost()).to(eq(115.25))
    end
  end

  describe(".between") do
    it("returns all purchases between a given start and end date") do
      test_purchase_1 = Purchase.create({ :purchase_date => "2015-01-25" })
      test_purchase_2 = Purchase.create({ :purchase_date => "2015-01-23" })
      test_purchase_3 = Purchase.create({ :purchase_date => "2014-12-31" })
      in_range_purchases = [test_purchase_1, test_purchase_2]
      start_date = "2015-01-01"
      end_date = "2015-01-25"
      expect(Purchase.between(start_date, end_date)).to(eq(in_range_purchases))
    end
  end

end
