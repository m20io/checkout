require 'forwardable'

class PriceDecorator
  extend Forwardable
  def_delegator :@decorated_product, :name, :code

  def initialize(product:, price:)
    @decorated_product = product
    @new_price = price
  end

  def price
    @new_price
  end
end