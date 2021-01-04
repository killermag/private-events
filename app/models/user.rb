class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_and_belongs_to_many :attended_events, join_table: 'invites' ,class_name: "Event"
  has_many :events, class_name: "Invite"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def email_required? 
    false 
  end 
    
  def email_changed? 
    false 
  end 

  def will_save_change_to_email?
    false
  end

end
