DemoApp::Application.routes.draw do
  resources :participants
  root 'participants#new'
end
