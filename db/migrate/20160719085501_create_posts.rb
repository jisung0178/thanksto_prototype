class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.text :description
      t.integer :fans
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
