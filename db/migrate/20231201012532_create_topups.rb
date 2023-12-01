class CreateTopups < ActiveRecord::Migration[7.0]
  def change
    create_table :topups do |t|
      t.decimal :amount
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :topups, :phone_number, unique: true
  end
end
