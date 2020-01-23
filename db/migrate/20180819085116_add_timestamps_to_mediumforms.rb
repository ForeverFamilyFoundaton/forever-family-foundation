class AddTimestampsToMediumforms < ActiveRecord::Migration[4.2]
  def change
    # Add timestamps column, but without a NOT NULL constraint
    add_timestamps :mediumforms, null: true

    # Backfill missing data with a really old date
    time = Time.zone.parse('2018-01-01 00:00:00')
    update "UPDATE mediumforms SET created_at = '#{time}'"
    update "UPDATE mediumforms SET updated_at = '#{time}'"

    # Restore NOT NULL constraints to be in line with the Rails default
    change_column_null :mediumforms, :created_at, false
    change_column_null :mediumforms, :updated_at, false

    # ...
  end
end
