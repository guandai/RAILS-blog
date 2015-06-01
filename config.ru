# This file is used by Rack-based servers to start the application.

Rails.application.config.relative_url_root = '/rails'
 
map Rails.application.config.relative_url_root || "/" do
  require ::File.expand_path('../config/environment',  __FILE__)
  run Blog::Application
end

#run Blog::Application
