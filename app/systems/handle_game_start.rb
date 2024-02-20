class HandleGameStart < Draco::System
  def tick(args)
    if args.inputs.keyboard.key_up.truthy_keys.any? || args.inputs.mouse.click
      world = Game.new
      args.state.world = world
    end
  end
end