require 'pry'


def get_first_name_of_season_winner seasons, season_label
  winner_info = seasons[season_label].find {|player_info| player_info["status"] == "Winner"}
  winner_info["name"].split.first 
end


def all_women seasons
  seasons.reduce([]) do |all_players, (season_label, player_list)|
    contestant = player_list.map do |player|
      player["season"] = season_label
      player
    end 
    all_players.concat contestant
  end 
end 

def get_contestant_name seasons, occupation
  gal = all_women(seasons).find {|player_info| player_info["occupation"] == occupation}
  gal["name"]
end


def count_contestants_by_hometown seasons, hometown
  neighbors = all_women(seasons).keep_if {|player_info| player_info["hometown"] == hometown}
  neighbors.count 
end


def get_occupation seasons, hometown
  gal = all_women(seasons).find {|player_info| player_info["hometown"] == hometown}
  gal["occupation"]
end


def get_average_age_for_season seasons, season_label
  total_years = seasons[season_label].reduce(0) do |total_years, player_info|
     total_years + (player_info["age"].to_i)
  end 
  (total_years.to_f / seasons[season_label].length ).round
end