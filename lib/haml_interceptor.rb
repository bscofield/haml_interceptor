require 'haml/html'

class HamlInterceptor
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    status, headers, resp = @app.call(env)
    body = resp.body.respond_to?(:join) ? resp.body.join : resp.body
    if js_response?(env, headers)
      body = Haml::HTML.new(body).render
    end
    [status, headers, body]
  end

  def js_response?(env, headers)
    env['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' || (headers.has_key?('Content-Type') && headers['Content-Type'] =~ /javascript/)
  end
end