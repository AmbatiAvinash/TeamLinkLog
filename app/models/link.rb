class Link < ApplicationRecord

  has_many :taggings, dependent: :delete_all
  has_many :tags, through: :taggings

  validates :url, presence: true
  before_create :link_details


  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).links
  end



  private

  def link_details
    link = LinkThumbnailer.generate(url)

    new_title = link.title
    new_description = link.description
    new_image = link.images.first.src.to_s rescue nil

    self.title = new_title if self.title.blank?
    self.description = new_description  if self.description.blank?
    self.image = new_image if self.image.blank?
  end
end
