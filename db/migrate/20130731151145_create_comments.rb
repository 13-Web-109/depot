class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :score
      t.string :title
      t.text :review
      t.integer :product_id

      t.timestamps
    end
  end
end
