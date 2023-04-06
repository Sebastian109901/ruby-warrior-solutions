class Player
    def play_turn(warrior)
      @health = warrior.health unless @health
      @direction = :backward

      if warrior.health < @health # Is warrior under attack
        puts 'Warrior is currently under attack'
        if warrior.health < 10 # Has warrior critical health?
          puts 'Warrior is critical health turning!'
          @direction = change_direction(@direction)
          warrior.walk!(@direction)
        elsif warrior.feel(@direction).enemy? # Feind
        puts 'Warrior feels enemy'
        warrior.attack!(@direction)
        else
          puts 'Warrior walks while attacked'
          warrior.walk!(@direction)
        end
      elsif warrior.feel(@direction).enemy? # Feind
        puts 'Warrior feels enemy'
        warrior.attack!(@direction)
      elsif warrior.health < 20

        warrior.rest!

      elsif warrior.feel(@direction).empty?
        puts 'Warrior feels empty and walks'
        warrior.walk!(@direction)
      else
        warrior.attack!(@direction)






      end
      @health = warrior.health # 10
    end
    def change_direction(direction)
      if direction == :backward
        puts 'Warrior turns from forward to backward'
        direction = :forward
      else
        puts 'Warrior turns from backward to forward'
        direction = :backward
      end
    end
end