# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:{current_user.id}" #en tant que user je souhaite acceder à mon channel
  end

  def unsubscribed
    stop_all_streams
  end
end
