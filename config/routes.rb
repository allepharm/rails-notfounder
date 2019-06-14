RailsNotFounder::Engine.routes.draw do
  match "*unmatched_route", to: "requests#create", via: :all
end
