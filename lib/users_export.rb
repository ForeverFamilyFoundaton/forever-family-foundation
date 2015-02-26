class UsersExport
  attr_accessor :users
  def initialize(users)
    @users = users
  end

  def to_csv
    @users.to_comma
  end
end