class ClothingTagAssignment < ActiveRecord::Base
  belongs_to :tag
  belongs_to :clothing_item

  def self.add_tags(params, clothing_item)
    tags_array = params[:tags].split(",")
    tags_array.each do |text|
      text.chomp
      while text[0] == " " do
        text[0] = ""
      end
      if Tag.find_by(text: text)
        tag = Tag.find_by(text: text)
      else
        tag = Tag.create(text: text)
      end
      ClothingTagAssignment.create(tag_id: tag.id, clothing_item_id: clothing_item.id) unless ClothingTagAssignment.find_by(tag_id: tag.id, clothing_item_id: clothing_item.id)
    end
    # AJM: Maybe return the created ClothingTagAssignment here?  You must not need it in your code.  I just expect to get the new tags if I called this.  Make sense?
  end

  #  AJM: I do not totally see how all these objects are related yet, but I believe you could look into active record destory vs delete and :dependent attributes
  def self.delete_tags(clothing_item)
    tag_assignments = clothing_item.clothing_tag_assignments
    tag_assignments_ids = []
    tag_assignments.each do |tag_assignment|
      tag_assignments_ids << tag_assignment.id
    end
    ClothingTagAssignment.destroy(tag_assignments_ids)
  end

end
