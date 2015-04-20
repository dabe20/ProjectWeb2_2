class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.text :productOffered

      t.timestamps
    end
  end
end
