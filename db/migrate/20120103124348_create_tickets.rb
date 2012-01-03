class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :user_id
      t.string :project_id
      t.string :state_id
      t.string :urgency_id
      t.string :intervention_id
      t.string :request_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
