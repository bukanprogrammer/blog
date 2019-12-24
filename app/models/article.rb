class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image_feature, ImageFeatureUploader

  belongs_to :category

  belongs_to :user

  has_many :taggings, dependent: :destroy

  has_many :tags, through: :taggings

  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {minimum: 100}
  validates :image_feature, presence: true
  validates :slug, presence: true

  acts_as_punchable

  def self.tagged_with(name)
    Tag.find_by!(name: name).articles
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

end
