require 'yaml'
# Be sure to restart your server when you modify this file
# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
#ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION



# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# http://railscasts.com/episodes/85
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]


Rails::Initializer.run do |config|

  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.active_record.observers = :cacher, :garbage_collector

  config.action_controller.session = {
    :session_key => '_calcpages_session',
    :secret      => 'ff40357824cc8720077127d8b51f68de0cb7b23fbee8b71095fae30a0a3eaaad9b0ca24380ba58fa4c5b2b70c6d7e1b4e40d23a02c7d3eb59e3106dc61ddabbe'
  }


  # config.active_record.default_timezone = :utc

  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"
  #config.load_paths += %W( #{RAILS_ROOT}/app/sweepers )
end
