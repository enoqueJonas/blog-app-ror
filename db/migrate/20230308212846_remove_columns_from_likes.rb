class RemoveColumnsFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :author_id
    remove_column :likes, :post_id
  end
end
