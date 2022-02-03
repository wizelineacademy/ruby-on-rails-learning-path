namespace :users do
  task add_role: :environment do
    user = User.all

    users.each do |user|
      puts user
    end  
  end
end