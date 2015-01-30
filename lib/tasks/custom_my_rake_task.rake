namespace 'custom_my_rake_task'do

  desc 'task is used to find names by id'
  task :find_by_id,[:id] => :environment do |task, args|
    user = User.find(args[:id])
    puts user.name.split
  end

  desc 'task is used to find data by name'
  task :find_by_name,[:name] => :environment do |task, args|
    args.with_defaults(:name => 'rahul')
    user = User.find_by_name(args[:name])
    puts user.name.split
  end

end
