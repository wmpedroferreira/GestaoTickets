class CreateUsers < ActiveRecord::Migration
  def self.change
    create_table :users do |t|
      t.string :name
      t.string :imgfilepath
      t.integer :tipouserid
      t.integer :clientadmingestorid

      t.timestamps
    end
  end
  def self.drop
 	drop_table :users
  end
end
