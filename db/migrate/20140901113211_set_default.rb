class SetDefault < ActiveRecord::Migration
  def change
    change_column :quotes, :likes, :integer, default: 0
  end
end
