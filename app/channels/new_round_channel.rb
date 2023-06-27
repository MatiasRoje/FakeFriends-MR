class NewRoundChannel < ApplicationCable::Channel
  def subscribed
    new_round = Room.find(params[:id])
    stream_for new_round
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
