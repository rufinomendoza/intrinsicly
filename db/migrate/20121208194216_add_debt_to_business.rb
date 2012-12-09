class AddDebtToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :current_debt, :float, :default => 0.0
  end
end
