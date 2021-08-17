class AwesomeMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, body = @app.call(env)

    body << '<br>And I am middleware above them all!!!'
    [status, header, body]
  end
end
