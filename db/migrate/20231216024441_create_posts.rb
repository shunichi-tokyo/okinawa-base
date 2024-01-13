class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.string  :area, null: false
      t.string  :event_name, null: false
      t.text    :event_detail, null: false
      t.string  :address, null: false
      t.date    :period, null: false
      t.string  :tag_index, null: false
      t.integer :price, null: false
    end
  end
end
