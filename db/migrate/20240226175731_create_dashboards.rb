class CreateDashboards < ActiveRecord::Migration[7.0]
  def change
    create_table :dashboards do |t|
      t.string :items
      t.integer :price
      t.string :product

      t.timestamps
    end
  end
end
