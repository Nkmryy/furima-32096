class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :freight_id, null: false
      t.integer :ship_state_id, null: false
      t.integer :ship_days_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
