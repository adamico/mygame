$gtk.debug_require!

require 'smaug.rb'

def tick(args)
  args.state.world ||= TitleScreen.new

  args.state.world.tick args
end

$gtk.reset_next_tick
