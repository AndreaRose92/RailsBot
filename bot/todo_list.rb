require "discordrb"
require "json"
require "rest-client"
require_relative "../config/token.rb"

bot = Discordrb::Commands::CommandBot.new token: $token, prefix: "!"

bot.command :user do |event|
  event.user.name
end

bot.command :new_chore do |event|
  event.respond "task name, estimated time"
  event.user.await! do |e|
    response = e.message.content.split(", ")
    RestClient.post "localhost:3000/tasks", {
      content: response[0],
      notes: response[1],
      user: event.user.id,
    }
    true
  end
  event.respond "On the list!"
end

bot.command :to_do_list do |event|
  response = JSON.parse RestClient.get "localhost:3000/users/#{event.user.id}"
  output = "#{event.user.name}'s list:" + "\n" + response["tasks"].map { |task| "#{task["content"]} (#{task["notes"]})" }.join("\n")
  event.respond output
end

bot.run
