require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger.config.access_token = ENV['FACEBOOK_ACCESS_TOKEN']
Facebook::Messenger.config.app_secret = ENV['FACEBOOK_APP_SECRET']
Facebook::Messenger.config.verify_token = ENV['FACEBOOK_VERIFY_TOKEN']
Facebook::Messenger::Subscriptions.subscribe

unless Rails.env.production?
  Dir["#{Rails.root}/app/bot/**/*.rb"].each { |file| require file }
end