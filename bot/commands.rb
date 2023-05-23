require "discordrb"
require_relative "../config/token.rb"

bot = Discordrb::Commands::CommandBot.new token: token, prefix: "!"

bot.command :user do |event|
  event.user.name
end

bot.command :bold do |_event, *args|
  "**#{args.join(" ")}**"
end

bot.command :italic do |_event, *args|
  "*#{args.join(" ")}*"
end

bot.command(:invite, chain_unusable: false) do |event|
  event.bot.invite_url
end

bot.command(:random, min_args: 0, max_args: 2, description: "Generates a random number between 0 and 1, 0 and max or min and max.", usage: "random [min/max] [max]") do |_event, min, max|
  if max
    num = rand(min.to_i..max.to_i)
  elsif min
    num = rand(0..min.to_i)
  else
    num = rand
  end
  return "between #{min} and #{max}, here's #{num}"
end

bot.command :long do |event|
  event << "This is a long message."
  event << "It has multiple lines that are each sent by doing `event << line`."
  event << "This is an easy way to do such long messages, or to create lines that should only be sent conditionally."
  event << "Anyway, have a nice day."
end

bot.run
