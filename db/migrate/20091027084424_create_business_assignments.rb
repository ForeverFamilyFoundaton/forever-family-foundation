class CreateBusinessAssignments < ActiveRecord::Migration
  def self.up
    create_table :business_assignments do |t|
      t.references :user
      t.references :business
      t.timestamps
    end
  end

  def self.down
    drop_table :business_assignments
  end
end
