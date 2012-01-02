class CreateInterventions < ActiveRecord::Migration
  def change
    create_table :interventions do |t|
      t.string :description
      t.string :short_description

      t.timestamps
    end
  end
end
