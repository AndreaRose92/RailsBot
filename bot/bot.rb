require "discordrb"

bot = Discordrb::Bot.new token: "MTExMDY0NDA4MDc2NzE1NjI1NQ.GYelN6.4RkEotUM9P9Ok-i0z_1AzT3R77squyqNSnaZgk"

bot.message(with_text: "Ping!") do |event|
  event.respond "Pong!"
end

bot.run
