class Checkout
  attr_accessor :pricing_rules
  attr_reader :items

  def initialize(rules)
    self.pricing_rules = rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    processed_items = pricing_rules.inject(items) do |decorated_items, rule|
      rule.call(decorated_items)
    end
    processed_items.inject(0) {|sum, item| sum + item.price }
  end

end