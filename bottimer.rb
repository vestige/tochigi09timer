require 'discordrb'

def setTime(total)
  @total = total
end

def totalTime()
  @total ||= 10
end

def setPrev(tm)
  @prev = tm
end

def prevTime()
  @prev ||= 0
end

def setStopFlg(enable)
  @stop = enable
end

def stopFlg()
  @stop
end

bot = Discordrb::Bot.new token: ENV['DISCODE']
def countDown(event)

  event.respond "#{Time.at(totalTime).utc.strftime('%M:%S')}"

  start = Time.now
  loop do
      break if stopFlg

      past = Time.now - start
      break if past > totalTime
      it = totalTime - past
      next if (! canDisplay(it))
      t = Time.at(it).utc.strftime('%M:%S')
      setPrev(it)
      event.respond "#{t}"
      sleep 0.05
  end
end

def canDisplay(remain)
  diff = prevTime - remain
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

bot.message(with_text: 'set') do |event|
  setTime(15)
  event.respond '15秒 Setしました'
end

bot.message(with_text: 'set5') do |event|
  setTime(5*60)
  event.respond '5分 Setしました'
end

bot.message(with_text: 'set30') do |event|
  setTime(30*60)
  event.respond '30分 Setしました'
end

bot.message(with_text: 'stop') do |event|
  event.respond 'やめー'
  setStopFlg(true)
end

bot.message(with_text: 'start') do |event|
  return unless stopFlg

  event.respond 'Timer Start!'
  event.respond "#{Time.now}"

  setStopFlg(false)
  countDown(event)
  setStopFlg(true)
 
  event.respond 'Timer End 888888'
  event.respond "#{Time.now}"
end

setStopFlg(true)
bot.run

