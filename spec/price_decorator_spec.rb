require_relative '../app/price_decorator.rb'
require_relative '../app/product.rb'

describe PriceDecorator do
  let(:product) { Product.apple }
  let(:new_price) { 100.1 }
  subject { PriceDecorator.new(product: product, price: new_price)}

  it 'decorates the price of a product' do
    expect(subject.price).to eql new_price
  end

  it "doesn't change other attributes" do
    expect(subject.name).to eql Product.apple.name
    expect(subject.code).to eql Product.apple.code
  end
end