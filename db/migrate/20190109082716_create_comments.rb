class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :email
      t.text :body
      t.integer :rate
      t.boolean :status

      t.references :stuff, foreign_key: true
      t.timestamps
    end
  end
end
