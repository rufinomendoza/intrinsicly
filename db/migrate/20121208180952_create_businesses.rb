class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :industry
      t.float :wacc
      t.float :terminal

      t.timestamps
    end
  end
end
