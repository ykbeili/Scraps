class User < ApplicationRecord
   has_many :scraps, dependent: :destroy
   has_many :ideas, dependent: :destroy
   has_many :ideascomments, dependent: :destroy
   has_many :scrapscomments, dependent: :destroy
   has_secure_password
   validates :first_name, :last_name, presence: true
   
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
   validates :email,
   presence: true,
   uniqueness: true,
   format: VALID_EMAIL_REGEX, unless: :from_omniauth?

   def self.find_from_omniauth(omniauth_data)
   User.where(provider: omniauth_data["provider"],
           uid:      omniauth_data["uid"]).first
   end

   def self.create_from_omniauth(omniauth_data)
   full_name = omniauth_data["info"]["name"].split
   User.create(uid:                      omniauth_data["uid"],
            provider:                 omniauth_data["provider"],
            first_name:               full_name[0],
            last_name:                full_name[1],
            oauth_token:              omniauth_data["credentials"]["token"],
            oauth_secret:             omniauth_data["credentials"]["secret"],
            email: omniauth_data["info"]["email"],
            oauth_raw_data:           omniauth_data,
            password:                 SecureRandom.hex(16)
            )
    end

   def full_name
   "#{first_name} #{last_name}"
   end
   private

   def from_omniauth?
   uid.present? && provider.present?
   end
 end
