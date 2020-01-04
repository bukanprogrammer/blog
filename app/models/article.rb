class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image

  belongs_to :category

  belongs_to :user

  has_many :taggings, dependent: :destroy

  has_many :tags, through: :taggings

  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {minimum: 100}
  validate :correct_image_type

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

  private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'Harus jpg atau png')
    elsif image.attached? == false
      errors.add(:image, 'Harus ada')
    end
  end

end
