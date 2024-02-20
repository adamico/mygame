class HandleRestart < Draco::System
  def tick args
    if args.inputs.mouse.click
      world = TitleScreen.new
      args.state.world = world
    end
  end
end