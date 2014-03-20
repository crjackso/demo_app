DemoApp::Application.routes.draw do
  resources :microsites

  resources :participants
  root 'participants#new'
end