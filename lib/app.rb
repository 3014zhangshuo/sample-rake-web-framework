require File.join(File.dirname(__FILE__), 'router.rb')

class App
  attr_reader :router

  def initialize
    @router = Router.new
  end
end
