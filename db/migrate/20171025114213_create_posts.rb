:80)class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :name
      t.integer :weight

      t.timestamps null: false
    end
  end
end
