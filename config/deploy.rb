# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'capistrano-bower'
set :repo_url, 'git@github.com:DockbitExamples/capistrano-bower.git'
set :branch, :master


desc 'Build assets with Bower'
task :build do
  run_locally do
    within "#{File.expand_path File.dirname(__FILE__)}/../app" do
      execute :npm, 'install'
      execute :npm, 'run-script build'
    end
  end
end
