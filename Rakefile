require 'rake/testtask'
   
task default: %w[tasks]

Rake::TestTask.new do |t|
  t.warning = true
  t.test_files = FileList['app/spec/*.spec.rb']
end

task :tasks do
  ruby "app/cli.rb --tasks"  
end

task :meeting do
  ARGV.each { |a| task a.to_sym do ; end }
  sh "ruby app/cli.rb --meeting #{ ARGV[1] }"
end

