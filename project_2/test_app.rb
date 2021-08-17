class TestApp
  def call(_env)
    sleep(3)
    [
      200,
      { 'Content-Type' => 'text/html' },
      ['<h1>Hello</h1>']
    ]
  end
end

# app = lambda do |env|
#   sleep(3)
#   [
#     200,
#     { 'Content-Type' => 'text/html' },
#     ['<h1>Hello</h1>']
#   ]
# end
