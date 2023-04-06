class Player

    def play_turn(warrior)
      @health = warrior.health unless @health
      @direction ||= :forward
      @wall_touched ||= false

      if warrior.feel.enemy? # Feind
        puts 'Warrior feels enemy'
        warrior.attack!
      elsif warrior.feel(@direction).captive? # Captive
        puts 'Warrior feels captive'
        warrior.rescue!(@direction)
      elsif warrior.health < @health # Is warrior under attack
        puts 'Warrior is currently under attack'
        if warrior.health < 10 # Has warrior critical health?
          puts 'Warrior is critical health turning!'
          @direction = change_direction(@direction)
          warrior.walk!(@direction)
        elsif warrior.feel.enemy?
          puts 'Warrior fights while attacked'
          warrior.attack!
        else
          puts 'Warrior walks while attacked'
          warrior.walk!(@direction)
        end
      elsif warrior.health < 20
        warrior.rest!
      elsif warrior.feel(@direction).wall?
        puts 'Warrior feels wall and turns'
        @wall_touched = true
        @direction = change_direction(@direction)
      elsif warrior.feel.stairs?
        if @wall_touched = true
          warrior.walk!(@direction)
        else
          puts 'Warrior feels stairs and turns'
          @direction = change_direction(@direction)
          warrior.walk!(@direction)
        end
      elsif warrior.feel.empty?
        puts 'Warrior feels empty and walks'
        warrior.walk!(@direction)
      end

      @health = warrior.health # 10
    end

     def change_direction(direction)
      if direction == :forward
        puts 'Warrior turns from forward to backward'
        direction = :backward
      else
        puts 'Warrior turns from backward to forward'
        direction = :forward
      end

      direction
    end
  end
