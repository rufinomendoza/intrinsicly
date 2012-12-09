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
    (tax/pretax)*100
  end

  def net_income
    pretax-tax
  end

  def ebiat
    (net_income+interest)*(1-tax_rate/100)
  end

  def ocf
    ebiat+da
  end

  def fcf
    ocf-capex-nwc_chg
  end

  def year_zero
    Time.now.year
  end

  def year_span
    period-year_zero
  end

  def disc_factor
    1/(1+Statement.wacc)**year_span
  end

  def dcf
    fcf*disc_factor
  end

  def self.terminal
    @business = Business.last # Change this to linked to user
    @business.terminal
  end

  def self.wacc
    @business = Business.last # Change this to linked to user
    @business.wacc
  end

  def self.current_debt
    @business = Business.last # Change this to linked to user
    @business.current_debt
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

  def self.comma_four(n)
    ActionController::Base.helpers.number_to_currency(n, :unit => "", :precision => 2)
  end


  def self.percent(n)
    ActionController::Base.helpers.number_to_percentage(n, :precision => 0)
  end

  def self.percent_dec(n)
    ActionController::Base.helpers.number_to_percentage(n, :precision => 2)
  end
end