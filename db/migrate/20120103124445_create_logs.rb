class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :ticket_id
      t.string :subject
      t.string :message
      t.string :close_ticket
      t.timestamps
    end
    add_index :logs, [:ticket_id, :created_at]  
  end

  

  def self.down
    drop_table :logs
  end
end
