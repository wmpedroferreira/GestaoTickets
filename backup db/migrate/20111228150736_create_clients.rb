class CreateClients < ActiveRecord::Migration
  def self.change
    create_table :clients do |t|
      t.integer :user_id
      t.string :short_description
      t.string :description

      t.timestamps
    end
  end
  def self.drop
	drop_table :clients
  end
end
