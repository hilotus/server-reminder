# encoding: utf-8

require 'rake'

class Reminder
  def self.perform
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")

    Event.each do |event|
      lunar_date = event.datetime.split[0]
      time = event.datetime.split[1]
      solar_date = $lunartosolar.lunarTosolar(lunar_date)
      now = Time.now.to_s.split
      if now[0] == solar_date

        if time == now[1].split(":").first(2).join(":")
          # if the time is equal the date that user set ,We will sent a message
          Rails.logger.debug("222222222222222222222222")

          api_key = "5MdUpTLcx2D6zahWuaWpIlnu"
          Rails.logger.debug("api_key")
          secret_key = "Vj0YwnokrhAwQ33QcrBQOBddeXVAg6b1"
          user = User.by_hash(event.user)
          channelid = "3610174057026970767"

          client = BaiduPush::Client.new(api_key, secret_key)
          client.resource = '3610174057026970767'
          messages = { title: 'title', description: 'desc' }
          client.push_msg 3, messages, 'android-test', message_type: 1
          Rails.logger.debug("33333333333333333333333")
        end

      end
    end
  end
end