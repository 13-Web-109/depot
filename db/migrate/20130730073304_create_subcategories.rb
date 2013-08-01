class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
