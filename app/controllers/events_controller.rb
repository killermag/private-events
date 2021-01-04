class EventsController < ApplicationController

      def index 
        @events = Event.all
      end 
    
      def new 
        if user_signed_in? 
        @event = Event.new 
        else 
          redirect_to new_user_registration_path, alert: "You need to login before making an event"
        end 
      end 
    
      def create 
        @event = current_user.created_events.create(sanitized_params)
    
        if @event.save 
          redirect_to root_path 
        else 
          render :new 
        end 
    
      end 
    
      def show 
        @event = Event.find(params[:id]) 
      end 
    
      def destroy 
        @event = Event.find(params[:id]) 
    
        @event.destroy 
        flash[:alert] = "Event removed" 
    
        redirect_to :index 
      end 
    
    
      def update 
    
      end 
    
    
      private 
    
      def sanitized_params  
        params["event"]["date"] = Date.strptime(params["event"]["date"] ,'%Y-%m-%d').to_date 
        params.require(:event).permit(:date, :location, :description ) 
      end 
    
      def self.past
        @past 
      end 
    
      def self.future 
        @future 
      end 
end
