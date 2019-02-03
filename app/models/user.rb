class User < ApplicationRecord
   has_many :scraps, dependent: :destroy
   has_many :ideas, dependent: :destroy
   has_many :ideascomments, dependent: :destroy
   has_many :scrapscomments, dependent: :destroy
   has_secure_password
   validates :first_name, :last_name, presence: true
   
   VALID_EMAIL_REGEX 

   def full_name
   "#{first_name} #{last_name}"
   end
   private

 end
