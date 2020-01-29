class CreateBusinessAssignments < ActiveRecord::Migration[4.2]
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
