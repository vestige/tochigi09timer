require 'discordrb'

bot = Discordrb::Bot.new token: 'Token'
def countDown(event)
  start = Time.now
  count = 20
  prev = 0
  loop do
      past = Time.now - start
      unit = calcUnit(count - past)
      fwd = past.div unit

      if fwd > prev
          event.respond "#{past}"
          prev = fwd
      end

      break if past > count
      sleep 0.05
  end
end 

def calcUnit(remainTime)
  return 5 if remainTime > 10
  return 2 if remainTime <= 10
end

bot.message(with_text: 'start') do |event|
  event.respond 'Timer Start!'
  event.respond "#{Time.now}"

  countDown(event);
 
  event.respond 'Timer End'
  event.respond "#{Time.now}"
end

bot.run

