# Write your code here!

def game_hash
  return {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{ "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }},
      { "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      }},
      { "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      }},
      { "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      }},
      {"Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }}]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{"Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      }},
      {"Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      }},
      {"DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }},
      {"Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      }},
      { "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }}]
    }
  }
end

def num_points_scored(player_name)
  data = game_hash
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        if name == player_name
          return stats[:points]
        end
      end
    end
  end
end

def shoe_size(player_name)
  data = game_hash
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        if name == player_name
          return stats[:shoe]
        end
      end
    end
  end
end

def team_colors(team_name)
  data = game_hash
  data.each do |team_type, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  data = game_hash
  result = []
  data.each do |team_type, team|
    result.push(team[:team_name])
  end
  return result
end

def player_numbers(team_name)
  data = game_hash
  result = []
  data.each do |team_type, team|
    if team[:team_name] == team_name
      team[:players].each do |player|
        player.each do |name, stats|
          result.push(stats[:number])
        end
      end
    end
  end
  return result
end

def player_stats(player_name)
  data = game_hash
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        if name == player_name
          return stats
        end
      end
    end
  end
end

def big_shoe_rebounds
  data = game_hash
  max_shoe_size = 0
  rebounds = 0
  
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        if stats[:shoe] > max_shoe_size
          max_shoe_size = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  end
  
  return rebounds
end

def most_points_scored
  data = game_hash
  max_points_scored = 0
  player_name = 0
  
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        if stats[:points] > max_points_scored
          max_points_scored = stats[:points]
          player_name = name
        end
      end
    end
  end
  
  return player_name
end

def winning_team
  data = game_hash
  max_points = 0
  team_name = nil
  
  data.each do |team_type, team|
    points = 0
    team[:players].each do |player|
      player.each do |name, stats|
        points = points + stats[:points]
      end
    end
    
    if points > max_points
      max_points = points
      team_name = team[:team_name]
    end
  end
  
  return team_name
end

def player_with_longest_name
  data = game_hash
  max_len = 0
  longest_player_name = 0
  
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        if name.length > max_len
          max_len = name.length
          longest_player_name = name
        end
      end
    end
  end
  
  return longest_player_name
end

def long_name_steals_a_ton?
   data = game_hash
  max_len = 0
  longest_player_name = nil
  max_steals = 0
  player_max_steals = nil
  
  data.each do |team_type, team|
    team[:players].each do |player|
      player.each do |name, stats|
        
        if name.length > max_len
          max_len = name.length
          longest_player_name = name
        end
        
        if stats[:steals] > max_steals
          max_steals = stats[:steals]
          player_max_steals = name
        end
      end
    end
  end
  
  return player_max_steals == longest_player_name
end
