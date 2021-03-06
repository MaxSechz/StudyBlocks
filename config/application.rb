require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StudyBlocks
  class Application < Rails::Application
    config.paperclip_defaults = {
      :storage => :s3,
      :s3_credentials => {
        :bucket => ENV['AWS_BUCKET'], #these values safely stored in application.yml thanks to figaro!
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
    }
  end
end
