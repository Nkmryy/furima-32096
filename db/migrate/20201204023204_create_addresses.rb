class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :state_id,  null: false
      t.string :address,     null: false
      t.string :street,      null: false
      t.string :buillding
      t.string :phone,       null: false
      t.references :order,    foreign_key: true
      t.timestamps
    end
  end
end
