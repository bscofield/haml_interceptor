require 'json'
class SampleApp
  def call(env)
    request = Rack::Request.new(env)

    if request.path == '/'
      content_type = 'text/html'
      body = '<html><head><title>Boneshaker</title></head><body><p>by Cherie Priest</p></body></html>'
    elsif request.path == '/ajax'
      content_type = 'application/javascript'
      body = '<h1>Boneshaker</h1><div id="author"><p>by Cherie Priest</p></div>'
    elsif request.path == '/json'
      content_type = 'application/javascript'
      body = JSON.generate({:name => 'Boneshaker', :markup => '<h1>Boneshaker</h1><div id="author"><p>by Cherie Priest</p></div>'})
    elsif request.path == '/empty'
      content_type = 'text/html'
      body = []
    end

    return Rack::Response.new(body, 200, {'Content-Type' => content_type}).finish
  end
end
