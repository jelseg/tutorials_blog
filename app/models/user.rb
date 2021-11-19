class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    before_save { self.email = email.downcase }

    has_secure_password

    validates :username, presence: true, length: { minimum: 4, maximum: 25}, 
                        uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 120},
                     uniqueness: { case_sensitive: false },
                     format: {with: VALID_EMAIL_REGEX}


end
