RSettings.find(:all).each { |e| e.destroy  }
RSettings.mail = "igor.alexandrov@gmail.com"
RSettings.age = 22
RSettings.height = 1.8
RSettings.good_man = true

User.all.each { |e| e.destroy  }
User.create!(:login => "igor", :first_name => "Igor", :last_name => "Alexandrov")
User.create!(:login => "aishek", :first_name => "Alexander", :last_name => "Borisov")