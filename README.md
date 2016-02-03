# World Domination Supermarket

We have the following price list:

```
+--------------|--------------|---------+
| Product Code |     Name     |  Price  |
+--------------|--------------|---------+
|     FR1      |   Fruit tea  |  $3.11  |
|     AP1      |   Apple      |  $5.00  |
|     CF1      |   Coffee     | $11.23  |
+--------------|--------------|---------+
```

If you buy one Fruit tea you get one free.

If you buy three or more apples you only pay 4.50 each.



## See some shopping examples

```
bundle install

rspec spec/example_spec.rb -f d
```

## The Code

Have a look at the pricing rules in `app/pricing_rules.rb` and `spec/pricing_rules_spec.rb`.

Also check out the awesome **Checkout** thing at `app/checkout.rb`
