class AddCategoryToTreehouses < ActiveRecord::Migration[5.1]
  def change
    add_column :treehouses, :category, :string
  end
end
