require 'helper'
require 'rack/test'

class TestHamlInterceptor < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    eval "Rack::Builder.new {( " + File.read(File.dirname(__FILE__) + '/test.ru') + "\n )}"
  end

  def test_it_should_ignore_html_responses
    get '/'
    assert_equal '<html><head><title>Boneshaker</title></head><body><p>by Cherie Priest</p></body></html>', last_response.body
  end

  def test_it_should_capture_js_responses_by_content_type
    get '/ajax'
    assert_equal last_response.body, <<HAML
%h1 Boneshaker
#author
  %p by Cherie Priest
HAML
  end

  def test_it_should_capture_js_responses_by_requested_header
    get '/', {}, {'HTTP_X_REQUESTED_WITH' => 'XMLHttpRequest'}
    assert_equal last_response.body, <<HAML
%html
  %head
    %title Boneshaker
  %body
    %p by Cherie Priest
HAML
  end

  def test_it_should_descend_into_json_responses
    get '/json'
    assert_equal JSON.parse('{"name":"Boneshaker\n", "markup":"%h1 Boneshaker\n#author\n  %p by Cherie Priest\n"}'),
      JSON.parse(last_response.body)
  end
end
