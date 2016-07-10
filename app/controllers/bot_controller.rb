class BotController < ApplicationController
  def receive
    # TODO: move to ActiveJob
    render status: :ok, json: {'message': 'hello world'}
  end
end
