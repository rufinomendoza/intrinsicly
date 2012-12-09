class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :period, :default => 2013
      t.float :revenue, :default => 0.0
      t.float :cgs, :default => 0.0
      t.float :opex, :default => 0.0
      t.float :da, :default => 0.0
      t.float :tax, :default => 0.0
      t.float :capex, :default => 0.0

      t.timestamps
    end
  end
end
