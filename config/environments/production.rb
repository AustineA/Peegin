Rails.application.configure do

  config.cache_classes = true


  config.eager_load = true


  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true


  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?


  config.assets.js_compressor = :uglifier

  config.assets.compile = true


  config.assets.digest = true


  config.log_level = :debug

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { :host => 'peegin.com' }

  #Sending email on the production side
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "peegin.com",
    :authentication => :plain,
    :user_name => "peegindictionary@gmail.com",
    :password => "omonaija"
  }

end
