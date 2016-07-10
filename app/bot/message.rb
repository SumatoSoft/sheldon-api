include Facebook::Messenger

Bot.on :message do |message|
  answer = ::Classifier::DataParser.query(message.text)
  Bot.deliver(
    recipient: message.sender,
    message: {
      text: answer
    }
  )
end
