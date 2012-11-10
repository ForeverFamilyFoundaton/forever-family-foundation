class CreateConfigVariables < ActiveRecord::Migration
  def change
    create_table :config_variables do |t|
      t.string :name
      t.string :value
      t.timestamps
    end
  end
end
