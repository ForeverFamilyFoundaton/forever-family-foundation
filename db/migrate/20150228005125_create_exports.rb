class CreateExports < ActiveRecord::Migration[4.2]
  def change
    create_table :exports do |t|

      t.timestamps
    end
  end
end
