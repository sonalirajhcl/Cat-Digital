require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CatterPillar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Load webhook endpoints YAML file
    # config.webhook_endpoints = YAML.load_file("#{Rails.root}/config/webhook_endpoints.yml")[Rails.env]
    config.webhook_endpoints = YAML.load_file("#{Rails.root}/config/webhook_endpoints.yml")[Rails.env]['endpoints']
 
  end
end
