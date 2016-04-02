require 'rack'
require 'rack/deflater'
require 'sinatra/base'
require 'json'
require 'benchmark'
require 'msgpack'
#require 'proximal/proximal'


class ProximalApp < Sinatra::Base
  configure do
    enable :logging
    set :server, %w[thin webrick]
  end
  use Rack::CommonLogger, STDOUT
  use Rack::ConditionalGet  # Support Caching
  use Rack::Deflater        # GZip

  def initialize
    super
  end

  get '/latest' do
    headers['Content-Type'] = 'text/plain'
    "meta-data"
  end

  get '/latest/meta-data' do
    headers['Content-Type'] = 'text/plain'
    "hostname\nmac\nlocal-ipv4\n"
  end

  get '/latest/meta-data/:metadata' do
    headers['Content-Type'] = 'text/plain'
    "work in progress"
  end

end
