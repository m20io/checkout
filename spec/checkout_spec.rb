require_relative '../app/checkout.rb'
require_relative '../app/product.rb'

describe 'checkout' do
  let(:pricing_rule) { double('a rule', call: nil) }
  let(:apple) { Product.apple }
  let(:co) { Checkout.new([pricing_rule]) }

  it 'accepts a pricing rules' do
    expect(co.pricing_rules).to eq [pricing_rule]
  end

  it 'scans an item' do
    co.scan(apple)
    expect(co.items).to eq [apple]
  end

  it 'calculates a total by involing the pricing rules' do
    expect(pricing_rule).to receive(:call).once { |arg| arg }
    co.scan(apple)
    expect(co.total).to eq apple.price
  end
end