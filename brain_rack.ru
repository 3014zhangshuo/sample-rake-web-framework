require 'rack'

Dir[File.dirname(__FILE__) + '/lib/controllers/*.rb'].each { |file| require file }

Rack::Handler::WEBrick.run(RequestController.new, Port: 9000)
