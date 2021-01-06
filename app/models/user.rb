class User < ApplicationRecord

  #------------------------VALIDATIONS--------------------------------------------------
  validates :username, presence: true 


  #/////////////////////////////////////////////////////////////////////////////////////


  # ----------------------ASSOCIATIONS--------------------------------------------------
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_and_belongs_to_many :attended_events, join_table: 'invites' ,class_name: "Event"
  has_many :events, class_name: "Invite"
  #/////////////////////////////////////////////////////////////////////////////////////

  


  #-------INCLUDING----THE---FOLLOWING---MODULES----FROM--DEVISE--FOR--USER--AUTH---------
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #/////////////////////////////////////////////////////////////////////////////////////



  #------------CHANGED------USER-----AUTHENTICATION---TO-----USERNAME----FROM---EMAIL
  def email_required? 
    false 
  end 
    
  def email_changed? 
    false 
  end 

  def will_save_change_to_email?
    false
  end
  #/////////////////////////////////////////////////////////////////////////////////////  




end
