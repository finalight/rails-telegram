class MessagesController < ApplicationController

    def index
        render :json => {:lol => "get all"}
    end

    def create()
        begin
            json_request = JSON.parse(request.body.read())
            from = json_request["message"]['from']['id']
            message = json_request['message']['text']

            options = {
                body: {
                chat_id: from,
                text: message
                }
            }
        
            response = HTTParty.post("https://api.telegram.org/bot" + ENV["TELEGRAM_API_KEY"] + "/sendMessage", options)
            puts response.body
        rescue Exception => e
            puts e.message
        end

    end

    def get
        render :json => {:lol => "hello"}
    end
end
