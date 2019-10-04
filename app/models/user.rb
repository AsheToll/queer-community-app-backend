class User < ApplicationRecord
    has_secure_password
    has_one_attached :profile_pic
    validates :username, uniqueness: {case_sensitive: false}
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
end