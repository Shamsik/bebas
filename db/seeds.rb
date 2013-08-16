user = Role.new
user.name = 'user'
user.save

puts "User role added!"

moderator = Role.new
moderator.name = 'moderator'
moderator.save

puts "Moderator role added!"

admin = Role.new
admin.name = 'admin'
admin.save

puts "Admin role added!"
