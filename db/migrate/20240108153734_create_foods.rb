class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
