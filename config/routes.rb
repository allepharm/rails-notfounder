RailsNotFounder::Engine.routes.draw do
  match "*unmatched_route", to: "missing#create", via: :all
end
