class Link < ApplicationRecord
  validates :url, presence: true
  before_create :link_details

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
