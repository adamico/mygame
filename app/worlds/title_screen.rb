class TitleScreen < Draco::World
  entity Background
  entity Title
  entity StartGameInstructions

  systems RenderLabels, RenderSolids, HandleGameStart
end