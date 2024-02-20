class RestartInstructions < Draco::Entity
  component Position, x: 640, y: 200
  component Label,
            text: 'Click Mouse to go to Title',
            size_enum: 5,
            alignment_enum: 1
  component Color
end