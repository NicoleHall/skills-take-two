require 'yaml/store'
require_relative 'skill'

class SkillInventory
  def self.database
    @database ||= YAML::Store.new("db/skill_inventory")
  end

  def self.create(skill)
    database.transaction do
      database['skills'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['skills'] << { "id" => database['total'], "title" => skill[:title], "description" => skill[:description], "mastery_level" => skill[:mastery_level] }
    end
  end

  def self.raw_skills
    database.transaction do
      database['skills']  || []
    end
  end

  def self.all
    raw_skills.map do |data|
      Skill.new(data)
    end
  end

  def self.raw_skill(id)
    raw_skills.find do |skill|
      skill["id"] == id
    end
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.delete(id)
    database.transaction do
      database['skills'].delete_if { |skill| skill["id"] == id}
    end
  end

end
