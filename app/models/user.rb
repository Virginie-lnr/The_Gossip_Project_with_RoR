class User < ApplicationRecord
  validates :username, 
  uniqueness: {case_sensitive: false}

  validates :first_name,
    presence: true,
    length: { minimum: 2 }

  validates :last_name,
    presence: true,
    length: { minimum: 2 }

  validates :email,
    presence: true,
    # format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please " },
    uniqueness: {case_sensitive: false}
  
  has_secure_password
  validates :password, 
    presence: true, 
    length: { minimum: 5 }
  
  has_secure_token :confirmation_token
    
  belongs_to :city, optional: true
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  def to_session
    {id: id}
  end 
end
