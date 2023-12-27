class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|

      t.timestamps
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
