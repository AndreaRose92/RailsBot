require "discordrb"
require_relative "../config/token.rb"

bot = Discordrb::Bot.new token: token

bot.message(with_text: "Ping!") do |event|
  event.respond "Pong!"
end

bot.run
