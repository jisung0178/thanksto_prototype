class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title #큰제목
      t.string :subtitle #작은제목
      
      t.string :link #좋아요url
      t.text :description_first 
      t.text :description_second
      t.text :description_third #브랜드 후원상품 내용
      t.integer :fans #목표인원
      t.string :brand #후원브랜드

      #사진 부가설명
      t.string :sub_first
      t.string :sub_second


      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
