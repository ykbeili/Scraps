class Scrap < ApplicationRecord
  belongs_to :user, optional: :true
  validates :title, presence: true, uniqueness: {message: 'must be unique'}
  validates :description, presence: true
  has_many :scrapscomments,dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      where(['title ILIKE ?', "%#{search}%"])
    else
      all.order(created_at: :asc)
    end
  end
end
