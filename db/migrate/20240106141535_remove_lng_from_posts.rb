class RemoveLngFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :lng, :float
  end
end
