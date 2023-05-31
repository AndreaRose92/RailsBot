require "discordrb"
require "rest-client"
require "rufus-scheduler"
require_relative "../config/token.rb"

scheduler = Rufus::Scheduler.new
bot = Discordrb::Bot.new token: $token

job = nil

bot.message(with_text: "Ping!") do |event|
  event.respond "Pong!"
end

bot.message(with_text: "Start") do |event|
  job = scheduler.every "1s", job: true do
    event.respond "ding"
  end
end

bot.message(with_text: "Stop") do |event|
  job.pause
  # puts job.last_time.to_i
  scheduler.in "#{Time.now.to_i - job.last_time.to_i + 1}s" do
    event.respond "dong"
  end
end

bot.message(with_text: "status") do |event|
  event.respond timer.paused?
end

bot.run

scheduler.join
