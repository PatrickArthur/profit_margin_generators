## ruby class that imports csv of gift cards sold to a business and generates key business
## indicators like cost, income, average spint per order etc....., checks that business
## card value isnt more then the revenue recieved for it and makes sure that
## cards are not redeemed before they are purchased or sold before being redeemed

class RevenueCalculator
  require 'csv'
  require 'profit_margin.rb'
  require 'calculate_profit.rb'

  attr_reader :file
  attr_accessor :orders

  def self.generate_report(file)
    new(file).initiate_process
  end

  def initialize(file)
    @file = file
    @orders = []
    ###will add in way to print errors
  end

  def initiate_process
    CSV.foreach(file) do |row|
      data = ProfitMargin.new(row)
      orders << data unless !data.valid?
    end
    CalculateProfit.key_indicators(orders)
  end
end

RevenueCalculator.generate_report("file.csv")
