# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

require 'rails/all'

Bundler.require(*Rails.groups) if defined?(Bundler)
