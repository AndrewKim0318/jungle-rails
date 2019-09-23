require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "create a new product" do
      newCategory = Category.create(name: "test")
      puts newCategory.id
      newProduct = Product.create(name: "shoes", price: 600, quantity: 5, category: Category.find(9))

      expect(newProduct).to be_valid

      newProduct.name = nil
      expect(newProduct).to_not be_valid

      newProduct.price_cents = nil
      newProduct.name = "shoes"
      expect(newProduct).to_not be_valid

      newProduct.price_cents = 600
      newProduct.quantity = nil
      expect(newProduct).to_not be_valid

      newProduct.quantity = 5
      newProduct.category = nil
      expect(newProduct).to_not be_valid
    end
  end
end