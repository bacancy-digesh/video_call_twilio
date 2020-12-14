class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :rooms
  has_many :sessions
  has_many :session_participates
  has_many :participate_sessions, through: :session_participates, source: :session
end
