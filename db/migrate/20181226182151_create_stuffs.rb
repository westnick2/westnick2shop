class CreateStuffs < ActiveRecord::Migration[5.2]
  def change
    create_table :stuffs do |t|
      t.string :title
      t.decimal :price
      t.text :short_description
      t.text :full_description
      t.text :preview_image
      t.boolean :in_stock
      t.string :slug

      t.timestamps
    end
  end
end
