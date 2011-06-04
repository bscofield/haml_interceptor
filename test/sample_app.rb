class SampleApp
  def call(env)
    request = Rack::Request.new(env)

    if request.path == '/'
      content_type = 'text/html'
      body = '<html><head><title>Boneshaker</title></head><body><p>Hello!</p></body></html>'
    else
      content_type = 'application/javascript'
      body = '<h1>Boneshaker</h1><div id="author"><p>by Cherie Priest</p></div>'
    end

    return Rack::Response.new(body, 200, {'Content-Type' => content_type}).finish
  end
end
