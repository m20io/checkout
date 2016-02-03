require_relative './price_decorator.rb'

class PricingRule
  def self.free_fruit_tea
    lambda do |items|
      next_free = false
      new_items = items.map do |item|
        if(item.code == 'FR1' && next_free)
          next_free = false
          PriceDecorator.new(product: item, price: 0.0)
        else
          next_free = true if item.code == 'FR1'
          item
        end
      end
      new_items
    end
  end

  def self.reduced_apples
    lambda do |items|
      three_or_more_apples = items.count {|item| item.code == 'AP1' } >= 3
      items.map do |item|
        if item.code == 'AP1' && three_or_more_apples
          PriceDecorator.new(product: item, price: 4.50)
        else
          item
        end
      end
    end
  end
end