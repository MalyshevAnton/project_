class SomeMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, body = @app.call(env)

    body << '<br>I am next middleware!'
    [status, header, body]
  end
end
