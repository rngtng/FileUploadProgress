require 'test_helper'

class AssetsControllerTest < ActionController::TestCase

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show new" do
    get :new
    assert_response :success
  end

  test "should show asset" do
    asset = Asset.create!
    get :show, { :id => asset.reload.id}
    assert_response :success
  end

  test "should create asset" do
    comment = "test"
    asset = Asset.new
    post :create, { :asset => { :uuid => asset.uuid, :comment => comment }}
    
    assert_response :success
    
    assert_equal comment, assigns(:asset).comment
    assert_equal asset.uuid, assigns(:asset).uuid
  end

  
end
