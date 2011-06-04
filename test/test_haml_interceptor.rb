require 'helper'
require 'rack/test'

class TestHamlInterceptor < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    eval "Rack::Builder.new {( " + File.read(File.dirname(__FILE__) + '/test.ru') + "\n )}"
  end

  def test_it_should_ignore_html_responses
    get '/'
    assert_equal last_response.body, '<html><head><title>Boneshaker</title></head><body><p>Hello!</p></body></html>'
  end

  def test_it_should_capture_js_responses
    get '/ajax'
    assert_equal last_response.body, <<HAML
%h1 Boneshaker
#author
  %p by Cherie Priest
HAML
  end
end
