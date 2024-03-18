Rails.application.routes.draw do
  # Rutas de Team
  post "/teams" => "team#create"
  get "/teams" => "team#index"
  get "/teams/:id" => "team#show"
  patch "/teams/:id" => "team#update"
  delete "/teams/:id" => "team#destroy"
  delete "/teams" => "team#destroy"

  # Rutas de Match
  get "/teams/:team_id/matches" => "match#team_matches"
  post "/matches" => "match#create"
  get "/matches/:team_id" => "match#show"
  patch "/matches/:match_id" => "match#update"
  get "/matches" => "match#index"
  

end
