class StartUserIdAt7001 < ActiveRecord::Migration
  def up
    execute("ALTER SEQUENCE users_id_seq RESTART 7001;")
  end

  def down
  end
end
