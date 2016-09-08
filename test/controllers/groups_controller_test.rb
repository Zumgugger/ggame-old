require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post groups_url, params: { group: { false_information: @group.false_information, member1: @group.member1, member2: @group.member2, member3: @group.member3, member4: @group.member4, name: @group.name, natel1: @group.natel1, natel2: @group.natel2, natel3: @group.natel3, natel4: @group.natel4, points: @group.points } }
    end

    assert_redirected_to group_url(Group.last)
  end

  test "should show group" do
    get group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_url(@group), params: { group: { false_information: @group.false_information, member1: @group.member1, member2: @group.member2, member3: @group.member3, member4: @group.member4, name: @group.name, natel1: @group.natel1, natel2: @group.natel2, natel3: @group.natel3, natel4: @group.natel4, points: @group.points } }
    assert_redirected_to group_url(@group)
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
  end
end
