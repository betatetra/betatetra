require_relative '../main'
require 'test/unit'
require 'rack/test'

set :environment, :test

class MainTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  def test_it_is_ok
    browser = Rack::Test::Session.new(Rack::MockSession.new(app))
    browser.get '/'
    assert browser.last_response.ok?
  end
  
  def test_it_shows_blank_gif
    browser = Rack::Test::Session.new(Rack::MockSession.new(app))
    browser.get '/'
    assert browser.last_response.ok?
    image = '/images/blank.gif'
    assert browser.last_response.body.include?(image)
  end
end