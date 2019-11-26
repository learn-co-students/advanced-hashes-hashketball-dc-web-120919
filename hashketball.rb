require "pry"

def game_hash
  {
    :home => {:team_name => "Brooklyn Nets", 
              :colors => ["Black", "White"], 
              :players => [
                {:players_name => "Alan Anderson",
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1
                },
                {:players_name => "Reggie Evans",
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7
                }, 
                 {:players_name => "Brook Lopez",
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
                 },
                 {:players_name => "Mason Plumlee",
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
                 },
                 {:players_name => "Jason Terry",
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1}
                ]
             },
    :away => {
                :team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => [
                  {:players_name => "Jeff Adrien",
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2
                },
                  {:players_name => "Bismack Biyombo",
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10
                },
                 {:players_name => "DeSagna Diop",
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
                },
                 {:players_name => "Ben Gordon",
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
                },
                 {:players_name => "Kemba Walker",
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12, 
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12
                   
                 }
            ]
    }
  }
  
end


    def num_points_scored(players_name)
        game_hash.each do |place,team|
          team.each do |attribute, data|
            if attribute == :players
                data.each do |person|
                  #person is the key for each player
                     if person[:players_name] == players_name
                        return person[:points]
                   end
                 end
              end
          end
        end
    end
    
    
    def shoe_size(player_name)
      game_hash.each do |place,team|
        team.each do |attribute,data|
          if attribute == :players
            data.each do |person|
              if person[:players_name] == player_name
                return person[:shoe]
              end
            end
          end            
      end
    end
  end
      
    

def team_colors(team_name)
  game_hash.each do |place,team|
    if team[:team_name] == team_name
      return team[:colors]
  end
end
end

def team_names
  game_hash.map do |place,team|
     team[:team_name]
    end
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |place,team|
    if team[:team_name] == team_name
    team.each do |attributes,data|
      if attributes == :players
        data.each do |players|
          nums << players[:number]
        end
      end
    end
  end
end
nums
end


def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:players_name] == players_name
            new_hash = player.delete_if do |key, val|
              key == :players_name
          end
        end
      end
    end
  end
end
new_hash
end




def big_shoe_rebounds()
  largest_shoe_size = 0
  largest_shoe_rebounds = 0
  
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:shoe] > largest_shoe_size
        largest_shoe_size = player[:shoe]
        largest_shoe_rebounds = player[:rebounds]
      end
    end
  end  
  return largest_shoe_rebounds
end


def most_points_scored
  max_points = 0
  top_scorer = ""
  game_hash.each do |place, team|
     team[:players].each do |player|
       
      # already iterating through with team[:players].each
     if player[:points] > max_points
       max_points = player[:points]
       top_scorer = player[:players_name]
   end
     end
     end
      top_scorer
       end
    
    def winning_team
      home_points = 0
      away_points = 0
      game_hash.each do |place, team|
        
        if place === :home 
          team[:players].map do |player|
          
           home_points = home_points + player[:points] 
           end
         else if place === :away
           team[:players].map do |player|
          
           away_points = away_points + player[:points] 
       end
      end
    end
  end
  if home_points > away_points
    return "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end
    
    def player_with_longest_name
      longest_name = ""
      game_hash.each do |place, team|
        # binding.pry
        team[:players].each do |player|
          if player[:players_name].length > longest_name.length
            longest_name = player[:players_name]
            
          end
        end
      end
      return longest_name
    end


def long_name_steals_a_ton?
  num_of_steals = 0
  long_name_steals = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      
      if player[:players_name] == player_with_longest_name  
       long_name_steals = player[:steals]
      # binding.pry
    end
  end
  end
  
  game_hash.each do |place,team|
    team[:players].each do |player|
      if player[:steals] > num_of_steals
        num_of_steals = player[:steals]
       
       if num_of_steals == long_name_steals
    return true
  end
  end
end
end

end

