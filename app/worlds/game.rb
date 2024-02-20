class Game < Draco::World
  entity Background
  entity Player, as: :player
  # entity UI
  
  systems RenderLabels, RenderSolids, RenderSprites, HandleInput, HandleGameOver

  # def render_ui
  #   if state.player_grabbed
  #     label = 'Click to release the square'
  #   else
  #     label = 'Click the square to grab and move'
  #     args.outputs.labels << [640, 120, 'you can also move the square with W A S D or cursor arrows', 5, 1]
  #   end
  #   args.outputs.labels << [640, 700, label, 5, 1]
  #   args.outputs.labels << [640, 60, 'Press Esc to go to Game Over', 5, 1]
  # end
end