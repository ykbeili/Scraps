class Scrap < ApplicationRecord
  belongs_to :user, optional: :true
  validates :title, presence: true, uniqueness: {message: 'must be unique'}
  validates :description, presence: true
  has_many :scrapscomments,dependent: :destroy
end
