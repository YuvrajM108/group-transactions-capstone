require 'application_system_test_case'

class GroupedProjectsTest < ApplicationSystemTestCase
  setup do
    @grouped_project = grouped_projects(:one)
  end

  test 'visiting the index' do
    visit grouped_projects_url
    assert_selector 'h1', text: 'Grouped Projects'
  end

  test 'creating a Grouped project' do
    visit grouped_projects_url
    click_on 'New Grouped Project'

    click_on 'Create Grouped project'

    assert_text 'Grouped project was successfully created'
    click_on 'Back'
  end

  test 'updating a Grouped project' do
    visit grouped_projects_url
    click_on 'Edit', match: :first

    click_on 'Update Grouped project'

    assert_text 'Grouped project was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Grouped project' do
    visit grouped_projects_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Grouped project was successfully destroyed'
  end
end
