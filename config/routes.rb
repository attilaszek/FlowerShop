Rails.application.routes.draw do
  post 'order/deliver'

  root to: 'order#dashboard'
end
