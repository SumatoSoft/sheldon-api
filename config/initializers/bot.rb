require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger.configure do |config|
  config.access_token = ENV['FACEBOOK_ACCESS_TOKEN']
  config.app_secret = ENV['FACEBOOK_APP_SECRET']
  config.verify_token = ENV['FACEBOOK_VERIFY_TOKEN']
end

Facebook::Messenger::Thread.set(
  setting_type: 'greeting',
  greeting: {
    text: 'Welcome to your new bot overlord!'
  }
)
