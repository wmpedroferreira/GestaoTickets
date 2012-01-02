class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :ticket_id
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
