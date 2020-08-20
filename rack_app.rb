require 'rack'
require 'pp'

class App
  def call(env)
    # pp env
    
    status = 200
    headers = {}
    body = [
      "hello world from rack"
    ]
    [status, headers, body]
  end
end

Rack::Handler::Thin.run App.new