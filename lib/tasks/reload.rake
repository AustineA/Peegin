task :reload => :environment do
  users = User.all

  users.each do |user|
    user.save
  end
  
end
