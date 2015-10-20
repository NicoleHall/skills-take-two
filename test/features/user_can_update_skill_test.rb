require_relative "../test_helper"

class UpdatedSkillTest < FeatureTest

  def test_user_can_update_an_existing_skill
    skill = SkillInventory.create({
      title: "Programming",
      description: "Boop boop boop",
      mastery_level: "Pro ninja brogramming"
    })
    visit "/skills/#{skill.id}"
    save_and_open_page
  end

end
