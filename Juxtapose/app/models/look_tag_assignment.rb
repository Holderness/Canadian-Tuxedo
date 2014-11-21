class LookTagAssignment < ActiveRecord::Base
  belongs_to :tag
  belongs_to :look

  def self.add_tags(params, look)
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
      LookTagAssignment.create(tag_id: tag.id, look_id: look.id) unless LookTagAssignment.find_by(tag_id: tag.id, look_id: look.id)
    end
  end

  def self.delete_tags(look)
    tag_assignments = look.look_tag_assignments
    tag_assignments_ids = []
    tag_assignments.each do |tag_assignment|
      tag_assignments_ids << tag_assignment.id
    end
    LookTagAssignment.destroy(tag_assignments_ids)

    redirect_to looks_path
  end

end

