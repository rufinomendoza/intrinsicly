class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :industry
      t.float :wacc, :default => 0.08
      t.float :terminal, :default => 0.03

      t.timestamps
    end
  end
end
