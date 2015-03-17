class CreateExports < ActiveRecord::Migration
  def change
    create_table :exports do |t|

      t.timestamps
    end
  end
end
