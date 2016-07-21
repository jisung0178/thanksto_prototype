class CreateIdols < ActiveRecord::Migration
  def change
    create_table :idols do |t|
      t.string :group_name

      t.timestamps null: false
    end
  end
end
