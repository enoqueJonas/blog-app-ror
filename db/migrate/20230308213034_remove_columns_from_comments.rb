class RemoveColumnsFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :author_id
    remove_column :comments, :post_id
  end
end
