class MessagesController < ApplicationController

  before_action :authorize

  def index

    @messages = Message.all.reverse


  end


  def send_msg

    url = "https://api.telegram.org/bot"
	  token = Rails.application.secrets.telegram_token

	  res = HTTParty.get("#{url}#{token}/getUpdates")

	  hash = JSON.parse(res.body)

	  chat_id = hash["result"][0]["message"]["chat"]["id"]
	  text = URI.encode("#{current_user.email}"+params[:msg])
	  HTTParty.get("#{url}#{token}/sendMessage?chat_id=#{chat_id}&text=#{text}")

    Message.create(
      content: params[:msg],
      user_id: session[:user_id]
    )

    redirect_to '/'
    # dfsdf
    #

  end
end
