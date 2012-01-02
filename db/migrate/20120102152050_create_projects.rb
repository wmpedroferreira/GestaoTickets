class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :client_id
      t.string :admin_id
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
