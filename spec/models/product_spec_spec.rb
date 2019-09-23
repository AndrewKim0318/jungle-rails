require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    xit "create a new product" do
      newCategory = Category.create(name: "test")
      newProduct = Product.create(name: "shoes", price: 600, quantity: 5, category: Category.find(newCategory.id))

      expect(newProduct).to be_valid

      newProduct.name = nil
      expect(newProduct).to_not be_valid
      expect(newProduct.errors.full_messages).to eq ["Name can't be blank"]

      newProduct.price_cents = nil
      newProduct.name = "shoes"
      expect(newProduct).to_not be_valid
      expect(newProduct.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
      
      newProduct.price_cents = 600
      newProduct.quantity = nil
      expect(newProduct).to_not be_valid
      expect(newProduct.errors.full_messages).to eq ["Quantity can't be blank"]
      
      newProduct.quantity = 5
      newProduct.category = nil
      expect(newProduct).to_not be_valid
      expect(newProduct.errors.full_messages).to eq ["Category can't be blank"]
      puts newProduct.errors.full_messages
    end
  end
end