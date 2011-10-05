rake_task = !Rake.blank? rescue true
DELAYED_JOB_PID_PATH = "#{Rails.root}/tmp/pids/delayed_job.pid"
if Rails.env.production? && !rake_task
  if !File.exist?(DELAYED_JOB_PID_PATH)
    puts "Starting Delayed JOB"
    Thread.new{ `script/delayed_job start` }
  else
    puts "Delayed Job is already running"
  end
end

