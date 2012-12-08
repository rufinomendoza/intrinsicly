class Business < ActiveRecord::Base
  attr_accessible :industry, :name, :terminal, :wacc, :current_debt
end
