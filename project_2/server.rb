require 'rack'
require 'thin'
require_relative 'test_app'
require_relative 'time_logging_middleware'
require_relative 'some_middleware'
require_relative 'awesome_middleware'

Rack::Handler::Thin.run(
  AwesomeMiddleware.new(SomeMiddleware.new(TimeLoggingMiddleware.new(TestApp.new)))
)
