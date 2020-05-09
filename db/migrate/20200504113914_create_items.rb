class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :user_id
      t.string :image
      t.string :description
      t.string :hoslink
      t.string :hostime
      t.string :showlist1
      t.string :showlistmiddle
      t.string :showlistbottom

      t.timestamps
    end
  end
end
