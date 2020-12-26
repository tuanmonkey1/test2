class CreateConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :configurations do |t|
      t.references :price, null: false, foreign_key: true
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
