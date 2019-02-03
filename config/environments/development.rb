Rails.application.configure do

  config.webpacker.check_yarn_integrity = true
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.active_storage.service = :local
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true






  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = {from: 'no-reply@lunabase.xyz'}




  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
  config.action_mailer.smtp_settings = {
    :address => 'in-v3.mailjet.com',
    :port => 2525,
    :user_name => 'b188e2b721f01aed40d7646212e22102',
    :password => Rails.application.credentials.sendjet,
    :authentication => 'login',
    :enable_starttls_auto => true
  }
end
