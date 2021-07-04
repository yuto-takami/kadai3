class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :xxx, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :yyy, through: :xxx, source: :zzz
  has_many :xxx, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :yyy, through: :xxx, source: :zzz
  attachment :profile_image
  
  validates :name, length: {minimum:2, maximum:20}, uniqueness: true
  validates :introduction, length: {maximum:50}
end
