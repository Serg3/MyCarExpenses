class CreateTransports < ActiveRecord::Migration[5.2]
  def change
    create_table :transports do |t|
      t.string :name, null: false
      t.string :mark, null: false
      t.string :model, null: false
      t.integer :edition_year, null: false

      t.timestamps
    end

    add_index :transports, [:mark, :model, :edition_year]
  end
end
