class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :transport, foreign_key: true
      t.date :date, null: false
      t.integer :mileage, null: false
      t.string :kind, null: false
      t.text :description
      t.numeric :amount, null: false, default: 0

      t.timestamps
    end
  end
end
