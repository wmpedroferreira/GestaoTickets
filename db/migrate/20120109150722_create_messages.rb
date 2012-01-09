class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :author_id
      t.integer :deliver_id
      t.string :subject
      t.text :body
      t.boolean :read
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
