class Scrapscomment < ApplicationRecord
  belongs_to :scrap
  validates :body, presence: true
  belongs_to :user, optional: :true
end
