class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :ticket_id
      t.string :subject
      t.string :messagem

      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
