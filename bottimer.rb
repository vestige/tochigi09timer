require 'discordrb'

class Ytimer
  attr_accessor :stopFlg
  attr_writer :totalTime

  def initialize
    @totalTime = 10
    @prev = 0
    @stopFlg = true
  end

  def countDown(event)
    @stopFlg = false
    event.respond "#{Time.at(@totalTime).utc.strftime('%M:%S')}"
    start = Time.now
    loop do
        break if @stopFlg

        past = Time.now - start
        break if past > @totalTime
        it = @totalTime - past
        next if (! canDisplay(it))
        t = Time.at(it).utc.strftime('%M:%S')
        @prev = it
        event.respond "#{t}"
        sleep 0.05
    end
    @stopFlg = true
  end

  def canDisplay(remain)
    diff = @prev - remain
    return false if (diff.to_i == 0) 

    unit = calcUnit(remain)
    rem = (remain % unit).to_i
    return (rem == 0)
  end

  def calcUnit(tm)
    return 30 if (61..nil).include? tm.to_i
    return 10 if (11..60).include? tm.to_i
    return 2 if (nil..10).include? tm.to_i
  end
end

bot = Discordrb::Bot.new token: ENV['DISCODE']
timer = Ytimer.new
  
bot.message(with_text: 'set') do |event|
  timer.totalTime = 15
  event.respond '15秒 Setしました'
end

bot.message(with_text: 'set5') do |event|
  timer.totalTime = 5*60
  event.respond '5分 Setしました'
end

bot.message(with_text: 'set30') do |event|
  timer.totalTime = 30*60
  event.respond '30分 Setしました'
end

bot.message(with_text: 'stop') do |event|
  event.respond 'やめー'
  timer.stopFlg = true
end

bot.message(with_text: 'start') do |event|
  return unless timer.stopFlg

  event.respond 'Timer Start!'
  event.respond "#{Time.now}"

  timer.countDown(event)

  event.respond 'Timer End 888888'
  event.respond "#{Time.now}"
end

bot.run

