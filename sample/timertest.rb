def setTime(total)
    @total = total
end

def count()
    @total ||= 10
end

def countDown()
    start = Time.now
    p start
    p count
    prev = 0
    loop do
        past = Time.now - start
        unit = calcUnit(count - past)
        fwd = past.div unit
 
        if fwd > prev
            p Time.now
            it = count - fwd * unit
            disp = Time.at(it).utc.strftime('%M:%S')
            puts "#{it}"
            puts "#{disp}" 
            prev = fwd
        end

        break if past > count
        sleep 0.05
    end
end

#20秒カウントダウンします
#10秒までは5秒おき
#10秒からは1秒おき

def calcUnit(remainTime)
    return 30 if (61..nil).include? remainTime.to_i
    return 10 if (11..60).include? remainTime.to_i
    return 2 if (nil..10).include? remainTime.to_i
end

setTime(180)
countDown()
p "888888"