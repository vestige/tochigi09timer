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
            puts "#{count - fwd * unit}" 
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
    return 5 if remainTime > 10
    return 1 if remainTime <= 10
end

setTime(15)
countDown()
p "888888"