class StartUserIdAt7001 < ActiveRecord::Migration[4.2]
  def up
    execute("ALTER SEQUENCE users_id_seq RESTART 7001;")
  end

  def down
  end
end
