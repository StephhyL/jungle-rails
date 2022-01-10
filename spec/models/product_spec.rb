require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'given all attributes' do
      it 'is valid with valid attributes' do
        @category = Category.find_or_create_by! name: 'Apparel'

        @product =
          @category.products.create(
            { name: 'Red Shoes', price: 10, quantity: 2 },
          )

        expect(@product).to be_valid
        # @shoe = Product.new(:name => 'Red Shoes', :price => 10, :quantity => 2, :category: 'Apparel' )
        # @shoe.save
        # expect(Product.all).to include (@shoe)
      end
    end

    it 'is not valid without a name' do
      @category = Category.find_or_create_by! name: 'Apparel'

      @product = @category.products.create({ price: 10, quantity: 2 })

      expect(@product).to_not be_valid
    end

    it 'is not valid without a price' do
      @category = Category.find_or_create_by! name: 'Apparel'

      @product = @category.products.create({ name: 'Red shoes', quantity: 2 })

      expect(@product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @category = Category.find_or_create_by! name: 'Apparel'

      @product = @category.products.create({ name: 'Red Shoes', price: 10 })

      expect(@product).to_not be_valid
    end

    it 'is not valid without a category' do
      # @product =
      #   Product.create(
      #     { name: 'Red Shoes', price: 10, quantity: 2, category_id: 1 },
      #   )

      @product =
        Product.create(
          { name: 'Red Shoes', price: 10, quantity: 2, category_id: 1 },
        )

      expect(@product).to_not be_valid
    end
  end
end
