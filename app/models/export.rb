class Export < ActiveRecord::Base
  has_attached_file :file 
  before_create :attach_file 

  def attach_file 
    users = User.all
    csv = UsersExport(users).to_csv
    # file = File.
  end
end
