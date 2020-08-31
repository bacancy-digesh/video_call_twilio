class RoomController < ApplicationController
    require 'twilio-ruby'

    def create
        account_sid = ""
        auth_token = ""
        
        room_name = params[:room][:name]
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        room = @client.video.rooms.create(unique_name: room_name)
        token = nil

       
        db_room = Room.new(user: current_user , sid: room.sid, name: room_name, token: token)
        if db_room.save
            redirect_to root_path
        end
    end

    def join
        @room = Room.find(params[:format])
        gon.room = @room.name
        gon.sid = @room.sid

        account_sid = ""
        api_secret = ""
        api_key_sid = ""

        gon.ROOM_NAME = @room.name

        # Create an Access Token
        gon.token = Twilio::JWT::AccessToken.new account_sid, api_key_sid, api_secret,
        identity: current_user.email

        # Grant access to Video
        grant = Twilio::JWT::AccessToken::VideoGrant.new
        grant.room = gon.ROOM_NAME
        gon.token.add_grant grant
        
        gon.token = gon.token.to_jwt
        

    end
    
end
