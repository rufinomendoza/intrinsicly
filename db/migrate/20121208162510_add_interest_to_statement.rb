class AddInterestToStatement < ActiveRecord::Migration
  def change
    add_column :statements, :interest, :float, :default => 0.0
  end  
end
