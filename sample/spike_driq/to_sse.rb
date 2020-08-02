require 'drb'

ro = DRbObject.new_with_uri "druby://localhost:54321"

10.times do |n|
    ro['src'].write(n)
    sleep 0.3
end