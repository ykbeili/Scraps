class Idea < ApplicationRecord
  belongs_to :user, optional: :true
  validates :title, presence: true, uniqueness: {message: 'must be unique'}
  validates :description, presence: true
  has_many :ideascomments,dependent: :destroy

  def self.search(search)
    if search
      where(['title ILIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
