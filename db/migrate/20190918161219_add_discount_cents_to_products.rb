class AddDiscountCentsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sales_percent_off, :integer
  end
end
