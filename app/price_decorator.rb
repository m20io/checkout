require 'forwardable'

class PriceDecorator
  extend Forwardable
  def_delegators :@decorated_product, :name, :code, :tea?, :apple?, :coffee?

  def initialize(product:, price:)
    @decorated_product = product
    @new_price = price
  end

  def price
    @new_price
  end
end