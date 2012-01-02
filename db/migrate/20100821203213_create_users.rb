class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :img_file_path
      t.string :client_admin_gestor_id
      t.string :tipo_user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
