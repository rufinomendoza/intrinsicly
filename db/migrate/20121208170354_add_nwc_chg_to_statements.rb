class AddNwcChgToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :nwc_chg, :float, :default => 0.0
  end
end
