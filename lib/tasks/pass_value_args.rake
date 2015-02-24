namespace :task do
  desc 'passes the args to the rake task'
  task :pass_value_args, [:id1] => :environment do |task, args|
    puts 'hello'
    args.with_defaults(:id1 => 'rahul')
    puts args[:id1]
    p args.extras
  end
end
