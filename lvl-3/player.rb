class Player
    def play_turn(warrior)
      @health = warrior.health unless @health
      if warrior.feel.empty?
        if warrior.health < 20 && @health <= warrior.health
         warrior.rest!
        else
         warrior.walk!
        end
      else
        warrior.attack!
      end
      @health = warrior.health
    end
  end
