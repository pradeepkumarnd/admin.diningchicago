require 'uglifier'

Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.js_compressor = Uglifier.new(copyright: false)

  config.assets.compile = false

  config.assets.digest = true

  logger = Logger.new("#{Rails.root}/log/#{Rails.env}.log", 4, 50.megabytes)
  logger.level = Logger::WARN
  config.logger = logger

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false

  config.paperclip_defaults = {
    convert_options: { all: '-quality 70 -strip -trim' },
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/s3.yml",
    s3_permissions: 'public-read',
    bucket: 'dinchi-assets',
    url: ':s3_alias_url',
    path: ':class/:attachment/:id_partition/:style/:filename',
    s3_host_alias: 'assets.diningchicago.com',
    s3_protocol: :http,
    s3_headers: { 'Expires' => (Time.now + 60 * 60 * 24 * 30 * 12).httpdate }
  }
end
