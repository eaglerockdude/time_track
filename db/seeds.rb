@user = User.create(email: 'test@gmail.com', first_name:'firstname', last_name:'lastname',password:'password', password_confirmation:'password')
puts "One user created."
AdminUser.create(email: 'admin@gmail.com', first_name:'adminfirstname', last_name:'adminlastname',password:'password', password_confirmation:'password')
puts 'One AdminUser created'
100.times do |post|
  Post.create!(date: Date.today + 1, rationale: "#{post} rationale content.",
               user_id: @user.id)
end

puts "Seed data has been created."

