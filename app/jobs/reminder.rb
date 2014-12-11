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
        end

      end
    end
  end
end