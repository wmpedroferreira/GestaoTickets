class CreateImpacts < ActiveRecord::Migration
  def change
    create_table :impacts do |t|
      t.string :description
      t.string :short_description

      t.timestamps
    end
  end
end
