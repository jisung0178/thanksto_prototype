class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :contents, default: "후원합니다❤︎"
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
