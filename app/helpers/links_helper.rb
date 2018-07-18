module LinksHelper

  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end

  def all_tags()
    tags = Tag.all.pluck(:name)
    tags.map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end
end
