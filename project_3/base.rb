require 'rack'
require 'thin'
require 'json'

module Application
  class Base
    attr_reader :routes, :request

    def initialize
      @routes = {}
    end

    def get(path, &handler)
      route('GET', path, &handler)
    end

    def post(path, &handler)
      route('POST', path, &handler)
    end

    def call(env)
      @request = Rack::Request.new(env)
      method = @request.request_method
      path = @request.path_info

      handler = @routes
                .fetch(method, {})
                .fetch(path, nil)
      if handler
        instance_eval(&handler)
      else
        [
          404,
          {},
          ["Undefined route #{path} for #{method}"]
        ]
      end
    end

    private

    def route(method, path, &handler)
      @routes[method] ||= {}
      @routes[method][path] = handler
    end

    def params
      @request.params
    end

    def body
      'This is main body'
    end
  end
end

our_app = Application::Base.new

our_app.get '/hello' do
  [200, {}, ["Our params: #{JSON(params)}"]]
end

our_app.post '/' do
  # TODO: try to represent body
  [200, {}, [request.body.read]]
end

# TODO: add couple of patch, delete request
# TODO: move your app to sinatra framework (example.rb)

Rack::Handler::Thin.run(our_app)
