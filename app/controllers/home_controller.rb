class HomeController < ApplicationController
    def index
        # @room = Room.new
        # @rooms = Room.all
        @session = Session.new
        @user_participations = current_user.session_participates
        # @user_participations_session = Session.where(id: @user_participations.session_id )
        @sessions = Session.all.select{|session| session != @user_participations}
        @user_sessions = current_user.sessions
        @participate_sessions = current_user.participate_sessions
    end
end
