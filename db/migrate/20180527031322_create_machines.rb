class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.string :model
      t.string :kind
      t.float :tableX
      t.float :tableY
      t.float :tablez
      t.float :roundx
      t.float :roundz

      t.timestamps null: false
    end
  end
end
