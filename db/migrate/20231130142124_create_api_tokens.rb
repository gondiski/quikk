class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens do |t|
      t.references :developer, null: false, foreign_key: true
      t.string :token, null: false
      t.boolean :active

      t.timestamps
    end
  end
end
