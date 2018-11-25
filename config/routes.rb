Rails.application.routes.draw do
  post 'order/deliver'

  root to: 'order#dashboard'

  mount API::Base, at: "/"

  mount GrapeSwaggerRails::Engine, at: "/documentation"
end
