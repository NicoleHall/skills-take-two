require 'yaml/store'
require_relative 'skill'

class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= YAML::Store.new("db/skill_inventory_test")
    else
      @database ||= YAML::Store.new("db/skill_inventory")
    end
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

  def self.update(id, data)
    database.transaction do
      target = database['skills'].find { |skill| skill["id"] == id}
      target["title"] = data[:title]
      target["description"] = data[:description]
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
