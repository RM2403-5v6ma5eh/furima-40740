class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product_name,             null: false
      t.text :description,                null: false
      t.integer :price,                   null: false
      t.timestamps
    end
  end
end
