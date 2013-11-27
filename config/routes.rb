Releasenotes::Application.routes.draw do
  root 'welcome#index'
  get 'welcome/index', to: 'welcome#index'
  post 'generate', to: 'welcome#generate'
  get 'generate', to: 'welcome#generate'
end
