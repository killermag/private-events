class UsersController < ApplicationController

    def show 
        @user_events = current_user.created_events
        @events = current_user.attended_events.where("date > ?", Time.now) 
    end 
end
