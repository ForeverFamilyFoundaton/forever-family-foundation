class GenerateUsersCsv < Struct.new
  def perform
    csv = User.includes(:addresses, :preferences).all.to_comma
    puts csv
  end
  
  
end