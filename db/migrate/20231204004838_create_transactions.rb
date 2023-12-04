class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :deposit
      t.decimal :withdrawal
      t.string :currency
      t.decimal :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
