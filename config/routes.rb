Rails.application.routes.draw do
  resources :prompts, only: [] do
    collection do
      get 'search'
    end
  end

  root "prompts#search"
end
