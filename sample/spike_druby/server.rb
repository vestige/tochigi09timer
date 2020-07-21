require 'drb/drb'

SERVER_URI="druby://localhost:8787"

class TimeServer

  def get_current_time
    return Time.now
  end

end

FRONT_OBJECT=TimeServer.new

DRb.start_service(SERVER_URI, FRONT_OBJECT, :safe_level => 1)
DRb.thread.join