require_relative '../app/product.rb'

describe Product do
  let(:example_price) { 3.11 }
  let(:example_name) { 'Fruit tea' }
  let(:example_code) { 'FR1' }
  let(:product) { Product.new(price: example_price, name: example_name, code: example_code) }

  it 'has a price' do
    expect(product.price).not_to be_nil
    expect(product.price).to eql example_price
  end

  it 'has a name' do
    expect(product.name).not_to be_nil
    expect(product.name).to eql example_name
  end

  it 'has a code' do
    expect(product.code).not_to be_nil
    expect(product.code).to eql example_code
  end
end