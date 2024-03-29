class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :amount, precision: 8, scale: 2
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
