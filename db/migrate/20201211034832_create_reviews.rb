class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :title
      t.text :content
      t.text :description

      t.timestamps
    end
  end
end
