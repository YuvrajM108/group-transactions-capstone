require 'test_helper'

class GroupedProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grouped_project = grouped_projects(:one)
  end

  test 'should get index' do
    get grouped_projects_url
    assert_response :success
  end

  test 'should get new' do
    get new_grouped_project_url
    assert_response :success
  end

  test 'should create grouped_project' do
    assert_difference('GroupedProject.count') do
      post grouped_projects_url, params: { grouped_project: {} }
    end

    assert_redirected_to grouped_project_url(GroupedProject.last)
  end

  test 'should show grouped_project' do
    get grouped_project_url(@grouped_project)
    assert_response :success
  end

  test 'should get edit' do
    get edit_grouped_project_url(@grouped_project)
    assert_response :success
  end

  test 'should update grouped_project' do
    patch grouped_project_url(@grouped_project), params: { grouped_project: {} }
    assert_redirected_to grouped_project_url(@grouped_project)
  end

  test 'should destroy grouped_project' do
    assert_difference('GroupedProject.count', -1) do
      delete grouped_project_url(@grouped_project)
    end

    assert_redirected_to grouped_projects_url
  end
end
