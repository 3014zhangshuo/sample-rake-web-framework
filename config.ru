require 'bundler'

Bundler.require # reuqire all from Gemfile

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

RackApplication = App.new

# Load the routes
require File.join(File.dirname(__FILE__), 'config', 'routes')

run RequestHandler.new
