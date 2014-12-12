# encoding: utf-8

require 'rake'

class Reminder
  def self.perform
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")
    Rails.logger.debug("111111111111111111111111")

    Event.each do |event|
      lunar_time = event.datetime.split.last
      solar_date = $lunartosolar.lunarTosolar(event.datetime.split.first)

      now = Time.now.to_s.split

      if solar_date.eql?(now.first) and lunar_time.eql?(now[1].split(":").first(2).join(":"))
        Rails.logger.debug("222222222222222222222222")
        Rails.logger.debug("222222222222222222222222")
        Rails.logger.debug("222222222222222222222222")
        user = User.by_user_id(event.user).first
        channelid = user.token.split('_').first
        userid = user.token.split('_').last

        client = BaiduPush::Client.new("5MdUpTLcx2D6zahWuaWpIlnu", "Vj0YwnokrhAwQ33QcrBQOBddeXVAg6b1")
        client.resource = channelid

        messages = {title: '', description: event.title, notification_basic_style: 7, open_type: 2}
        params = {message_type: 1, device_type: 4, user_id: userid, channel_id: channelid}
        client.push_msg(1, messages, Time.now.to_s, params)

        Rails.logger.debug("33333333333333333333333")
        Rails.logger.debug("33333333333333333333333")
        Rails.logger.debug("33333333333333333333333")
      end
    end
  end
end