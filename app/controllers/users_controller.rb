class UsersController < ApplicationController
    @user_events = current_user.created_events
    @events = current_user.attended_events
end
