class AddPurchaseDateToPurchases < ActiveRecord::Migration
  def change
    add_column(:purchases, :purchase_date, :datetime)
  end
end
