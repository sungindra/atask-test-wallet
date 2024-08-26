class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :transaction_type
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
