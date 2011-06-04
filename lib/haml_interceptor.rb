require 'haml/html'

class HamlInterceptor
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    status, headers, resp = @app.call(env)
    body = if resp.respond_to?(:body)
      resp.body.respond_to?(:join) ? resp.body.join : resp.body
    else
      resp
    end

    if js_response?(env, headers)
      body = parse(body)
    end
    [status, headers, body]
  end

  def js_response?(env, headers)
    env['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' || (headers.has_key?('Content-Type') && headers['Content-Type'] =~ /javascript/)
  end

  def parse(body, json = true)
    parsed = json ? (JSON.parse(body) rescue body) : body
    if parsed.respond_to?(:values)
      parsed.keys.each do |key|
        parsed[key] = parse(parsed[key], false)
      end
    else
      parsed = Haml::HTML.new(parsed).render
    end
    json ? (JSON.generate(parsed) rescue parsed) : parsed
  end
end