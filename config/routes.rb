Rails.application.routes.draw do

  root to: "search#search"

  get 'search/results'
  get 'search/originAirport'
  post 'search/originAirport'
  get 'search/desAirport'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
