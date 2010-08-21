class CreateRelationshipTables < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer   :with_user_id
      t.integer   :user_id
      t.string    :kind
      t.boolean   :confirmed, :default => false
      t.timestamps
    end
    add_index(:relationships, :with_user_id)
    add_index(:relationships, :user_id)
    add_index(:relationships, :kind)
  end
  
  def self.down
    drop_table :relationships
  end
end
