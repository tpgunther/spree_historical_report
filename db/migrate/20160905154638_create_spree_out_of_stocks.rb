class CreateSpreeOutOfStocks < ActiveRecord::Migration
  def change
    create_table :spree_out_of_stocks do |t|
      t.date :date
      t.integer :variant_id

      t.timestamps null: false
    end
  end
end
