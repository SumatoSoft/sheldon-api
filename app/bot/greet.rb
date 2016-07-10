include Facebook::Messenger

Facebook::Messenger::Thread.set(
  setting_type: 'greeting',
  greeting: {
    text: 'Welcome to your new bot overlord!'
  }
)