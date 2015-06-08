# This is a sample deploy script.
# Rename this file to deploy.rb and Helicon Zoo will execute this script as a deploy process.
# After execution is finished Helicon Zoo will rename it to deploy_done.rb
# Rename it to deploy.rb to start deploy task again when needed.


require 'rbconfig'

APP_ROOT = File.dirname( __FILE__ ).freeze
RUBY_BIN = RbConfig::CONFIG[ 'bindir' ].freeze
RACK_ENV = ( ENV[ 'RACK_ENV' ] || 'production' ).freeze

Dir.chdir( APP_ROOT )

def deploy( env, &block )
  return unless RACK_ENV == env.to_s
  block.call
end


def run( task, wrap = true )
  args = task.split
  cmd = args.shift

  ARGV.clear
  ARGV.unshift( *args )

  # We use 'load' because it doesn't spawn child ruby process,
  # which might be problematic in hosting environment.
  exe = File.join( RUBY_BIN, cmd )
  puts ">> #{exe} #{ARGV.inspect}"
  load( exe, wrap )
rescue Errno::EACCES => e
  puts 'Insufficient file system permissions.' +
    'Please make sure IIS application pool user has enough rights to access application files.' +
    "Usually Write permission isn't granted where it's needed. Exception: #{e}"
rescue Object => e
  puts e.to_s
  # Deploy tries to run all tasks. Some exceptions aren't relevant. See log if it matters.
end


deploy :development do
  run 'bundle install'
  run 'rake db:create --trace'
  run 'rake generate_session_store --trace'
  run 'rake db:migrate --trace'

  # TODO: add more development tasks here
end


deploy :production do
  run 'bundle install'
  run 'rake db:create --trace'
  run 'rake generate_session_store --trace'
  run 'rake db:migrate --trace'

  # TODO: add more production tasks here
end