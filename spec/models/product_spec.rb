require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    let (:category) {Category.create(name: "Watches")}
    let (:product) {Product.new(name: "Rolex", price_cents:300000, quantity: 3, category_id: category.id)}

    it "is valid with valid attributes" do
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      # let (:category) {Category.create(name: "Shoes")}
      # let (:product) {Product.new(name: "", price_cents:300000, quantity: 3, category_id: category.id)}
      product.name = nil
      product.save
      expect(product.errors.full_messages).to include("Name can not be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product.price_cents = nil
      product.save
      # byebug
      expect(product.errors.full_messages).to include("Price can not be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without quantity" do
      product.quantity = nil
      product.save
      expect(product.errors.full_messages).to include("Quantity can not be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without category" do
      product.category = nil
      product.save
    end

  end
end
