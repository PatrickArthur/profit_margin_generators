class CalculateProfit
  attr_reader :orders

  def self.key_indicators(orders)
    new(orders).display_indicators
  end

  def initialize(orders)
    @orders = orders
  end

  def display_indicators
    puts "total revenue from store #{format("$%.2f",total_revenue)}"
    puts "total points from store #{format("$%.2f",total_points)}"
    puts "total points redeemed from store #{format("$%.2f",total_redeemed)}"
    puts "total cost to store was #{format("$%.2f",total_cost)}"
    puts "net income of store is #{format("$%.2f",net_income)}"
    puts "stores profit margin is #{profit_margin}"
    puts "stores average profit margin is #{average_profit_margin}"
    puts "customers spent per order #{average_spent_per_order}"
  end

  private

  def total_revenue
    orders.map {|n| n.revenue}.sum
  end

  def total_points
    orders.map {|n| n.points}.sum
  end

  def total_redeemed
    orders.map {|n| n.redeemed_amount}.sum
  end

  def total_cost
    total_points - total_redeemed
  end

  def net_income
    total_revenue - total_cost
  end

  def profit_margin
    (net_income/total_revenue)*100
  end

  def average_profit_margin
    profit_margin/orders.count
  end

  def average_spent_per_order
    total_revenue/@orders.count
  end
end
