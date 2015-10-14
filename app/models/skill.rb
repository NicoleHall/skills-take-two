class Skill
  attr_reader :title,
  :description,
  :mastery_level,
  :id

  def initialize(data)
    @id = data["id"]
    @title = data["title"]
    @description = data["description"]
    @mastery_level = data["mastery_level"]
  end


end
