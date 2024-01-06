class RemoveAreaFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :area, :string
  end
end
