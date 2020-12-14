class CreateLaptops < ActiveRecord::Migration[6.0]
  def change
    create_table :laptops do |t|
      t.string :title
      t.integer :distribute
      t.text :content
      t.decimal :price
      t.text :brand

      t.timestamps
    end
  end
end
