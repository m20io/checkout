require 'pry'

require_relative '../app/pricing_rule.rb'
require_relative '../app/product.rb'

describe PricingRule do
  describe 'fruit tea - buy one get one free' do
    let(:tea_price) { Product.tea.price }
    let(:coffee_price) { Product.coffee.price }

    let(:processed_items) do
      PricingRule.free_fruit_tea.call([Product.tea, Product.coffee, Product.tea])
    end

    it 'prices the first tea normal' do
      expect(processed_items[0].price).to eql tea_price
    end

    it 'prices the second tea for free' do
      expect(processed_items[2].price).to eql 0.0
    end

    it "doesn't change the other prices" do
      expect(processed_items[1].price).to eql coffee_price
    end
  end

  describe 'reduced apples' do
    let(:apple_price) { Product.apple.price }
    let(:coffee_price) { Product.coffee.price }
    let(:reduced_price) { 4.50 }

    let(:reduced_apples) do
      PricingRule.reduced_apples.call(
        [Product.apple, Product.coffee, Product.apple, Product.apple]
      )
    end
    let(:regular_apples) do
      PricingRule.reduced_apples.call([Product.apple, Product.coffee])
    end

    context 'with three or more apples' do
      it 'all have a reduced price' do
        expect(reduced_apples[0].price).to eql reduced_price
        expect(reduced_apples[2].price).to eql reduced_price
        expect(reduced_apples[3].price).to eql reduced_price
      end
    end

    context 'with less than three apples' do
      it 'all have the regular price' do
        expect(regular_apples[0].price).to eql apple_price
      end
    end

    it "doesn't change other prices" do
      expect(reduced_apples[1].price).to eql coffee_price
    end
  end
end