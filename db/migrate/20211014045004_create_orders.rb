class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_number, null: false
      t.integer    :area_id, null: false
      t.string     :municipalities, null: false
      t.string     :address, null: false
      t.string     :tell_number, null: false
      t.references :shared,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
