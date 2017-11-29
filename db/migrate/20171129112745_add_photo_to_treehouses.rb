class AddPhotoToTreehouses < ActiveRecord::Migration[5.1]
  def change
    add_column :treehouses, :photo, :string
  end
end
