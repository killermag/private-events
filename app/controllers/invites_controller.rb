class InvitesController < ApplicationController
    def new 
        @event = Event.find sanitized_params[:event_id] 
        @users = User.where("id <> ?",current_user.id)
        @invite = Invite.new
    end 

    def create 
        @user = User.find allow_user_and_invite[:user][:id]
        if @user.events.create sanitized_params
            redirect_to new_event_invite_path 
        else 
            render :new 
        end 
    end 


    def destroy  
        @invites  = Invite.find_by(user_id: params[:id])
        if @invites.destroy 
            redirect_to new_event_invite_path
        else 
            render :new 
        end 
    end 



    private 

    def sanitized_params
        params[:event_id] = params[:event_id].to_i 
        params.permit(:event_id)
    end 

    def allow_user_and_invite 
        params.require(:invite).permit(:user => [:id])
    end 

    def destroy_params 
        params.permit(:event_id, :id) 
    end 

end

