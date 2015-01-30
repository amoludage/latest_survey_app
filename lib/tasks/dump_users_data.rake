desc 'dumps the users data123'
task :dump_users_data,[:id,:name] => :environment do |task, args|
  puts 'hi, i am inside rake task'
  puts args

  user = User.find(args[:id])
  puts user.name.split
  puts User.count
  user1 = User.find_by_name(args[:name])
  user1.name = 'amol udage'
  user1.save
  puts user1.name.split

  user.name = 'rahul vidhate'
  user.save
=begin
  user1 = User.last.name
  name = user1.name
  name1 = name.split(' ')
  first_name = name[0]
  last_name = name[1]
  print 'first name is ',first_name
  puts
  print 'last name is ',last_name
  puts
=end
end
