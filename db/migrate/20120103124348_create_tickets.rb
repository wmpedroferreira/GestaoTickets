class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :state_id
      t.string :urgency_id
      t.string :intervention_id
      t.string :request_type_id
      t.timestamps
    end
    add_index :tickets, [:user_id, :created_at]
  end

  def self.down
    drop_table :tickets
  end
end
