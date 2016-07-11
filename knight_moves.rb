
class Game
  MOVES = [[-1,-2],[-1,2],[-2,1],[-2,-1],[1,2],[1,-2],[2,-1],[2,1]]

  def knight_moves(start_move,end_move)
    shortest_path = ""
    possible_paths = valid_next_step([start_move])
    while shortest_path.empty?
      paths = []
      possible_paths.each_with_index do |path, index|
        if path[-1] == end_move
          shortest_path = path
          break
        end
        paths += valid_next_step(path)
      end
      possible_paths = paths
    end
    puts "You made it in #{shortest_path.length-1} moves! Here's your path: "
    shortest_path.each {|move| p move}
  end

  def valid_next_step(path)
    possible_moves = []
    possible_paths = []
    MOVES.each do |move|
      x = path[-1][0] + move[0]
      y = path[-1][1] + move[1]
      possible_moves << [x,y] if x.between?(1,8) && y.between?(1,8) && !path.include?([x,y])
    end
    possible_paths = possible_moves.map { |move| (path + [move]) }
  end

end

game = Game.new
game.knight_moves([3,3],[4,3])
game.knight_moves([1,4],[8,8])
