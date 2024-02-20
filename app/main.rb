require 'app/lib/draco.rb'

%w[color label position size solid speed sprite].each do |file_name|
  require "app/components/#{file_name}"
end

%w[background game_over instructions player restart_instructions start_game_instructions title].each do |file_name|
  require "app/entities/#{file_name}"
end

%w[handle_game_over handle_game_start handle_input handle_restart render_labels render_solids render_sprites].each do |file_name|
  require "app/systems/#{file_name}"
end

require 'app/worlds/game.rb'
require 'app/worlds/title_screen.rb'

def tick(args)
  args.state.world ||= TitleScreen.new

  args.state.world.tick args
end

$gtk.reset
