# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'capistrano-bower'
set :repo_url, 'git@github.com:DockbitExamples/capistrano-bower.git'
set :branch, :master


desc 'Build assets with Bower'
task :build do
  run_locally do
    within "#{File.expand_path File.dirname(__FILE__)}/../app" do
      # Get dependencies with Hacher
      execute :hacher, 'get -k node_app -f package.json'
      execute :hacher, 'get -k bower_app -f bower.json'

      execute :npm, 'install'
      execute :npm, 'run-script build'

      # Cache dependencies with Hacher
      execute :hacher, 'set -k node_app -f package.json ./node_modules'
      execute :hacher, 'set -k bower_app -f bower.json ./bower_components'
    end
  end
end
