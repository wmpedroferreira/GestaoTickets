class CreateProjecTs < ActiveRecord::Migration
  def change
    create_table :projec_ts do |t|
      t.string :name
      t.integer :client_id

      t.timestamps
    end
  end
end
