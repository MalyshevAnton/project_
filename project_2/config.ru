require 'thin'
require_relative 'test_app'
require_relative 'time_logging_middleware'
require_relative 'some_middleware'
require_relative 'awesome_middleware'

use TimeLoggingMiddleware
use SomeMiddleware
use AwesomeMiddleware
run TestApp
# TODO: 1) create 1 or 2 middlewares for app; 2) move app class and middlewares to separated files
