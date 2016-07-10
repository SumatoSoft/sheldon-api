Rails.application.routes.draw do
  match 'receive' => 'bot#receive', via: [:get]
end
