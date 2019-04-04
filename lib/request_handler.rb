class RequestHandler
  def call(env)
    route = RackApplication.router.route_for(env)
    if route
      response = route.execute(env)
      response.rack_response
    else
      [404, {}, []]
    end
  end
end
