class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
    has_and_belongs_to_many :attendees, class_name: 'User', join_table: 'invites'
    
    
    scope :upcoming  , -> { where('date >= ? ', Time.now ) }
    scope :past , -> { where('date < ? ', Time.now + 10 ) }
    
end
