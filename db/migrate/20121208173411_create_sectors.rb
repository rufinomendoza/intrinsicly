class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.float :wacc, :default => 0.08

      t.timestamps
    end
  end
end
