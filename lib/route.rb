require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', 'base_controller')
require 'active_support/core_ext/string'

class Route
  attr_accessor :klass_name, :path, :instance_method

  def initialize(route_array)
    @path = route_array.first
    @klass_name = route_array.last[:klass]
    @instance_method = route_array.last[:method]
    handle_requires
  end

  def klass
    Module.const_get(klass_name)
  end

  def execute(env)
    klass.new(env).send(instance_method.to_sym)
  end

  def handle_requires
    require File.join(File.dirname(__FILE__),
      '../', 'app', 'controllers', "#{klass_name.underscore}.rb")
  end
end
