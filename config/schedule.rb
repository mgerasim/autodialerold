# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "log/cron_log.log"

every :minute do
  rake "dial:run"
end

every :hour do
  rake "dial:incommings", :output => {:error => 'log/incommings_error.log', :standard => 'log/incommings_cron.log'}
end

every 1.day, at: '4:30 am' do
  rake "dial:clear"
end
