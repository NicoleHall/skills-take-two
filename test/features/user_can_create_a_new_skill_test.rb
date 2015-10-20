require_relative "../test_helper"

class NewSkillTest < FeatureTest

  def test_user_can_create_new_skill
    visit "/skills/new"
    assert_equal '/skills/new', current_path

    fill_in("skill[title]", with: 'New Skill Title' )
    fill_in("skill[description]", with: 'New Skill Description' )
    #click_button "Submit"
    find('#submit-skills').click

    assert_equal "/skills", current_path
    assert page.has_content?("New Skill Title")
  end


end
