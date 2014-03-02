require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:craig).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should be 404" do
    get :show, id: "nothingnew"
    assert_response :not_found
    #assert_template 'profiles/show'
  end

  test "test variables are assigned on profile view" do
    get :show, id: users(:craig).profile_name
    assert assigns(:user)
    #assert_template 'profiles/show'
    assert_not_empty assigns(:statuses)
  end


  test "only statuses of correct user are shown" do
    get :show, id: users(:craig).profile_name
    assigns(:statuses).each do |status|
      assert_equal users(:craig), status.user
    end
  end

end
