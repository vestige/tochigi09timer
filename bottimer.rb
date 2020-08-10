require 'discordrb'

bot = Discordrb::Bot.new token: 'Token'
def countDown(event)
  start = Time.now
  unit = 1
  count = 10
  loop do
    
    event.respond "#{} s" if Time.now - start > unit
    break if Time.now - start > count
    sleep 0.05
  end
  #event.respond "#{remain} s"
end

bot.message(with_text: 'start') do |event|
  event.respond 'Timer Start!'
  event.respond "#{Time.now}"

  countDown(event);
 
  event.respond 'Timer End'
  event.respond "#{Time.now}"
end

bot.run



#start 

#set
#start
#stop
#reset




