require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
#config.assets.precompile += %w( breakpoints.min.js acoes.js browser.min.js jquery-desafio/init.js main.css )

module DeveloperEvolution
  class Application < Rails::Application
    config.i18n.default_locale = :'pt-BR'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.use Warden::Manager

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.eager_load_paths << Rails.root.join("lib")
  end
end
