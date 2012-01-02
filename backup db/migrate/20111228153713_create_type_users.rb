class CreateTypeUsers < ActiveRecord::Migration
  def change
    create_table :type_users do |t|
      t.integer :description

      t.timestamps
    end
  end
end
