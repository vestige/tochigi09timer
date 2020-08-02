require 'drb/drb'

SERVER_URI="druby://localhost:8787"

DRb.start_service
timeserver = DRbObject.new_with_uri(SERVER_URI)
puts timeserver.get_current_time