def countDown()
    start = Time.now
    p start
    count = 20
    prev = 0
    loop do
        past = Time.now - start
        unit = calcUnit(count - past)
        fwd = past.div unit
 
        if fwd > prev
            puts "#{count - fwd * unit}" 
            p Time.now
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

countDown()