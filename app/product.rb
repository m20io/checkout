class Product
  attr_accessor :price, :name, :code

  def self.tea
    Product.new(price: 3.11, name: 'Fruit tea', code: 'FR1')
  end

  def self.apple
    Product.new(price: 5, name: 'Apple', code: 'AP1')
  end

  def self.coffee
    Product.new(price: 11.23, name: 'Coffee', code: 'CF1')
  end

  def tea?
    code == 'FR1'
  end

  def apple?
    code == 'AP1'
  end

  def coffee?
    code == 'CF1'
  end

  def initialize(price: 0.0, name: '', code: '')
    self.price = price
    self.name  = name
    self.code  = code
  end
end