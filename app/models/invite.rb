class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :invited?, -> (user,event){ where("user_id = ?", user).where("event_id = ?",event) }
end
