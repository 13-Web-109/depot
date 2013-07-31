class RemoveSubcategoryIdFromSubcategories < ActiveRecord::Migration
  def up
    remove_column :subcategories, :subcategory_id
  end

  def down
    add_column :subcategories, :subcategory_id, :integer
  end
end
