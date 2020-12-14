class SessionUsersController < ApplicationController
    def create
        session = Session.new
        session.title = params[:session][:title]
        session.description = params[:session][:description]
        session.user = current_user
        session.unique_room = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
        session.unique_password = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
        if session.save
            redirect_to root_path
        end
    end

    def user_participate
        participate = SessionParticipate.new
        participate.user = current_user
        participate.session_id = params[:id]
        if participate.save
            redirect_to root_path
        end
    end
    def join_session
        @session = Session.find(params[:id])
        @current_user_participation = SessionParticipate.where(user: current_user, session_id: @session.id)
        unless @current_user_participation
            redirect_to root_path
        end
        if @session.user != current_user
            return redirect_to participate_path(@session)
        end
    end
    def participate
        @session = Session.find(params[:id])
        @current_user_participation = SessionParticipate.where(user: current_user, session_id: @session.id)
        unless @current_user_participation
            redirect_to root_path
        end
    end     
end
