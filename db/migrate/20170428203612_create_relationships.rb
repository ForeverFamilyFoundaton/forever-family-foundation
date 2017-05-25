class CreateRelationships < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.string :name
      t.string :typeof

      t.timestamps null: false
    end
  end
  def down
    drop_table :relationships if ActiveRecord::Base.connection.table_exists? 'relationships'
  end
end
