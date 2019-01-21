class AddOldPriceToStuffs < ActiveRecord::Migration[5.2]
  def change
    add_column :stuffs, :old_price, :decimal
  end
end
