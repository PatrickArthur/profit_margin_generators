class ProfitMargin

  HEADERS = [:revenue, :points, :sold_date, :redeemed_amount, :redeemed_date]

  attr_accessor :revenue, :points, :sold_date, :redeemed_amount, :redeemed_date

  def initialize(row)
    order = generate_order(row)
    @revenue = order[:revenue].to_f
    @points = order[:points].to_f
    @sold_date = Date.strptime(order[:sold_date], "%m/%d/%Y")
    @redeemed_amount = order[:redeemed_amount].to_f
    @redeemed_date = Date.strptime(order[:redeemed_date], "%m/%d/%Y")
  end

  def valid?
    if @redeemed_amount > @points
      false
    elsif @points > @revenue
      false
    elsif @sold_date > @redeemed_date
      false
    elsif @redeemed_date < @sold_date
      false
    else
      true
    end
  end

  private

  def generate_order(row)
    hash = {}
    row.each_with_index {|elm,i| hash[ProfitMargin::HEADERS[i]] = elm}
    hash
  end
end
