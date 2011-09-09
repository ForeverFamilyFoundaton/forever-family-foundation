#lib/tasks/import.rake
desc "Imports a CSV file into an ActiveRecord table"
task :csv_model_import => :environment do
  require 'csv'
  preferences = ['I want to receive email newsletters','Do Not Mail','I would like to take active role in work on the foundation','Corp Member','Benefactor Info','Memorial Cont']
  duplicate = 0
  records = 0 
  preferences.each do |preference|
    Preference.find_or_create_by_name(:name=>preference,:preference_type=>'Profile')
  end
  CSV.open("#{Rails.root}/fff.csv", :headers => :false).each do |row|
    user = User.new
    user.email = ((row[13] == '*') || row[13].blank?) ? "#{row[3]}#{row[2]}@donotsend.com" : row[13] # replace blank emails as firstname@donotsend.com
    if User.find_by_email(user.email)
      duplicate += 1
      user.email = "duplicate" + user.email # Appending 'duplicate' so that we can easily find the records with duplicate email'
    end
    puts "**************** Importing user with email #{user.email} **************"
    user.password = 'password'
    user.first_name = row[3]
    user.last_name = row[2]
    user.middle_name = row[4]
    user.cell_phone = row[16]
    user.home_phone = row[14]
    user.work_phone = row[15]
    user.fax = row[17]
    user.enrolled_from = row[23]
    user.created_at = row[25].blank? ? Date.today : row[25]
    if user.save(:run_callbacks => false)
      puts "User #{user.first_name} imported"
      records += 1
    else
      puts "Error!! User #{user.first_name} could not be saved"
      puts "Errors: #{user.errors.inspect}"
      exit
    end
    #Importing profile preferences
    puts 'Updating profile preferences'
    user.profile_preferences << Preference.profile_preferences.find_by_name("Do Not Mail") unless row[1].blank?
    user.profile_preferences << Preference.profile_preferences.find_by_name("I want to receive email newsletters") unless row[18].blank?
    user.profile_preferences << Preference.profile_preferences.find_by_name("I would like to take active role in work on the foundation") unless row[19].blank?     
    user.profile_preferences << Preference.profile_preferences.find_by_name("Corp Member") unless row[20].blank?
    user.profile_preferences << Preference.profile_preferences.find_by_name("Benefactor Info") unless row[21].blank?
    user.profile_preferences << Preference.profile_preferences.find_by_name("Memorial Cont") unless row[22].blank?
    #Importing address      
    puts 'Updating address'
    user_address = user.build_address
    user_address.address = row[5]
    user_address.address << ' ' << row[6] unless row[6].blank? # Appending Address 1 and address 2 into address column
    user_address.city = row[7]
    user_address.state = row[8]
    user_address.zip = row[9]
    user_address.country = row[11]
    user_address.save(:run_callbacks => false)

    #Importing family members
    puts 'Updating Family Members'
    family_members = [[row[28],row[29]],[row[31],row[32]],[row[33],row[34]],[row[35],row[36]]] #All members in array
    family_members.each do |member|   
      if (member[0] || member[1])
        family_member = user.family_members.new
        unless member[0].blank?
          name = member[0].split(' ') #Separating first name and last name
          family_member.first_name =  name[0]
          family_member.last_name = name[1,name.length] if name.length > 1 #Middle name and last name into last_name column
        end 
        family_member.relationship = member[1] unless member[1].blank?
        family_member.save(false)
      end 
    end
    #Importing notes
    notes = [row[24],row[26],row[27]]
    notes.each do |note|
      user.notes.create(:content => note) unless note.blank?
    end  
    puts "************************* All details saved - #{user.first_name}"
  end
  puts "+++++++++++++++++++Summary+++++++++++++++++++++++++++++++++"
  puts "+++++++++++++++++++ Entries with Duplicate email  :- #{duplicate}"
  puts "+++++++++++++++++++ Total records imported  :- #{records}"
end

