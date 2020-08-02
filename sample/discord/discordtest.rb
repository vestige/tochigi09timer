require 'discordrb'

bot = Discordrb::Commands::CommandBot.new(
    token: 'TOKEN',
    client_id: 'CLIENT_ID',
    prefix: '/'
)

bot.command :hello do |event|
    event.send_message("Hello,World.#{event.user.name}")
end

bot.run