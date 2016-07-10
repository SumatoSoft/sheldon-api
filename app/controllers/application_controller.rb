class ApplicationController < ActionController::API
  def index
    render status: :ok, json: { message: 'Hello world' }
  end
end
