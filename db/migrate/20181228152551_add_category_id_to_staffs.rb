class AddCategoryIdToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :stuffs, :category_id, :integer
  end
end
