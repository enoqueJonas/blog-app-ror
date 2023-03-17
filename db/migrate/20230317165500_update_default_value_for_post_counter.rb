class UpdateDefaultValueForPostCounter < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :post_counter, from: nil, to: 0
  end

  def down
    change_column_default :users, :post_counter, from: 0, to: nil
  end
end
