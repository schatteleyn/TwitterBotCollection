require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.cron '0 10 * * *' do
  `ruby dontforget.rb`
end
