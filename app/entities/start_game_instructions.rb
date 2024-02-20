class StartGameInstructions < Draco::Entity
  component Position, x: 640, y: 460
  component Label,
            text: 'Click Mouse to start',
            size_enum: 5,
            alignment_enum: 1
  component Color
end