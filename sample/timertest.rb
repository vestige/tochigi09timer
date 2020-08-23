def setTime(total)
    @total = total
end

def total()
    @total ||= 10
end

def countDown()
    puts "#{Time.at(total).utc.strftime('%M:%S')}"

    start = Time.now
    @prev = 0
    loop do
        past = Time.now - start
        break if past > total
        it = total - past
        next if (!canDisplay(it))
        t = Time.at(it).utc.strftime('%M:%S')
        @prev = it
        puts "#{t}"
        sleep 0.05
    end
end

def canDisplay(remain)
    diff = @prev - remain
    return false if (diff.to_i == 0) 
 
    unit = calcUnit(remain)
    rem = (remain % unit).to_i
    return (rem == 0)
end

def calcUnit(remainTime)
    return 30 if (61..nil).include? remainTime.to_i
    return 10 if (11..60).include? remainTime.to_i
    return 2 if (nil..10).include? remainTime.to_i
end


p ENV['DISCODE']

setTime(13)
countDown()
p "888888"