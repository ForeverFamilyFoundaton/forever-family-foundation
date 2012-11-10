class CreateConfigVariables < ActiveRecord::Migration
  def change
    create_table :config_variables do |t|
      t.string :name
      t.string :value
      t.timestamps
    end
    ConfigVariable.create! name: 'Price', value: '100'
  end
end
