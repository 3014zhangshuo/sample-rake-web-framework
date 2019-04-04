RackApplication.router.config do
  get "/test", to: "custom_controller#index"
  get /.*/, to: "custom_controller#show"
end
