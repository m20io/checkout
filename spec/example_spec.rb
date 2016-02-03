require_relative '../app/checkout.rb'
require_relative '../app/product.rb'
require_relative '../app/price_decorator.rb'
require_relative '../app/pricing_rule.rb'


describe 'example' do
  let(:rules) { [PricingRule.free_fruit_tea, PricingRule.reduced_apples] }

  # for this example the sum was wrong - 22.25 makes no sense
  it 'Basket: FR1, AP1, FR1, CF1 => Total price expected: $19.34' do
    co = Checkout.new(rules)
    co.scan(Product.tea)
    co.scan(Product.apple)
    co.scan(Product.tea)
    co.scan(Product.coffee)
    expect(co.total).to eql 19.34
  end

  it 'Basket: FR1, FR1 => Total price expected: $3.11' do
    co = Checkout.new(rules)
    co.scan(Product.tea)
    co.scan(Product.tea)
    expect(co.total).to eql 3.11
  end

  it 'Basket: AP1, AP1, FR1, AP1 => Total price expected: $16.61' do
    co = Checkout.new(rules)
    co.scan(Product.apple)
    co.scan(Product.apple)
    co.scan(Product.tea)
    co.scan(Product.apple)
    expect(co.total).to eql 16.61
  end
end