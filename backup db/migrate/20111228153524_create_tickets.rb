class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :project_id
      t.datetime :datetime_created
      t.datetime :datetime_closed
      t.integer :state_id
      t.integer :urgency_id
      t.integer :impact_id
      t.integer :intervention_id
      t.integer :requestType_id

      t.timestamps
    end
  end
end
