Rails.application.configure do
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.raise_runtime_errors = true

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
    s3_headers: { 'Expires' => (Time.now + (60 * 60 * 24 * 30 * 12)).httpdate }
  }
end
