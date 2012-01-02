class CreateUrgencies < ActiveRecord::Migration
  def change
    create_table :urgencies do |t|
      t.string :description
      t.string :short_description

      t.timestamps
    end
  end
end
