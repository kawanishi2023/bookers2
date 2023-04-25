class DropBooks < ActiveRecord::Migration[6.1]
  def change
    drop_table :Books 
  end
end
