class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.string  :area, null: false
      t.string  :event_name, null: false
      t.text    :event_detail, null: false

    end
  end
end
