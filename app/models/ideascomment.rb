class Ideascomment < ApplicationRecord
  belongs_to :idea
  validates :body, presence: true
  belongs_to :user, optional: :true
end
