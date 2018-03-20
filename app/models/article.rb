class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  searchkick
  
  has_many :comments, dependent: :destroy
  has_many :like_articles, dependent: :destroy
  belongs_to :catalog
  belongs_to :user
  has_attached_file :avatar

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, length: { minimum: 3, maximum: 100 } , uniqueness: true
  validates :body, presence: true, length: { minimum: 5 }
end
