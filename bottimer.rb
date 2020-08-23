require 'discordrb'

def setTime(total)
  @total = total
end

def totalTime()
  @total ||= 10
end

bot = Discordrb::Bot.new token: ''
def countDown(event)
  start = Time.now
  prev = 0
  loop do
      past = Time.now - start
      unit = calcUnit(totalTime - past)
      fwd = past.div unit

      if fwd > prev
          it = totalTime - past
          disp = Time.at(it).utc.strftime('%M:%S')
          event.respond "#{disp}"
          prev = fwd
      end

      break if past > totalTime
      sleep 0.05
  end
end 

def calcUnit(remainTime)
  return 5 if remainTime > 10
  return 2 if remainTime <= 10
end

bot.message(with_text: 'set') do |event|
  #set 50
  setTime(33)
  event.respond '30s Setしました'
end

bot.message(with_text: 'start') do |event|
  event.respond 'Timer Start!'
  event.respond "#{Time.now}"

  countDown(event);
 
  event.respond 'Timer End'
  event.respond "#{Time.now}"
end

bot.run

