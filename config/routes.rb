Rails.application.routes.draw do
  root to: 'application#index'
  mount Facebook::Messenger::Server, at: 'bot'
end
