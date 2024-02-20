class HandleGameOver < Draco::System
  def tick(args)
    if args.inputs.keyboard.escape
      world.systems.delete(HandleInput)
      world.systems.delete(HandleGameOver)

      world.systems << HandleRestart
      
      world.entities << GameOver.new
      world.entities << RestartInstructions.new
    end
  end
end