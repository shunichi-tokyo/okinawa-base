class RemoveLatFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :lat, :float
  end
end
