require 'haml/html'

class HamlInterceptor
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    if headers.has_key?('Content-Type') && headers['Content-Type'] =~ /javascript/
      body = Haml::HTML.new(body.body.join).render
    end
    [status, headers, body]
  end
end