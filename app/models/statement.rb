class Statement < ActiveRecord::Base
  attr_accessible :capex, :cgs, :da, :opex, :period, :revenue, :tax, :interest, :nwc_chg

  validates_uniqueness_of :period

  def gp
    revenue-cgs
  end

  def ebitda
    gp-opex
  end

  def ebit
    ebitda-da
  end

  def pretax
    ebit-interest
  end 

  def tax_rate
    tax/pretax
  end

  def net_income
    pretax-tax
  end

  def fcf
    net_income+da-capex-nwc_chg
  end

  def year_zero
    Time.now.year
  end

  def year_span
    period-year_zero
  end

end



class Format
  # Formatting across the 
  def self.currency(n)
    ActionController::Base.helpers.number_to_currency(n, :unit => "$", :precision => 0)
  end

  def self.currency_dec(n)
    ActionController::Base.helpers.number_to_currency(n, :unit => "$", :precision => 2)
  end  

  def self.comma(n)
    ActionController::Base.helpers.number_to_currency(n, :unit => "", :precision => 0)
  end
  
  def self.comma_dec(n)
    ActionController::Base.helpers.number_to_currency(n, :unit => "", :precision => 2)
  end

  def self.percent(n)
    ActionController::Base.helpers.number_to_percentage(n, :precision => 0)
  end

  def self.percent_dec(n)
    ActionController::Base.helpers.number_to_percentage(n, :precision => 2)
  end
end