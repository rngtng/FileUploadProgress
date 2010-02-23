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

  test "should create empty asset with comment" do
    comment = "test"
    asset = Asset.new
    post :create, { :asset => { :uuid => asset.uuid, :comment => comment }}
    
    assert_response :success
    
    assert_equal comment, assigns(:asset).comment
    assert_equal asset.uuid, assigns(:asset).uuid
  end

  test "should create asset without comment" do
    file = fixture_file_upload('Example.jpg', 'image/jpeg')
    
    asset = Asset.new
    post :create, { :asset => { :uuid => asset.uuid, :file => file }}
    
    assert_response :success
    
    assert assigns(:asset).file.path
    assert_equal asset.uuid, assigns(:asset).uuid
  end

  test "should add file to existing asset" do
    comment = "test"
    file = fixture_file_upload('Example.jpg', 'image/jpeg')
    
    asset = Asset.create( :comment => comment)
    asset.save!
     
    post :create, { :asset => { :uuid => asset.uuid, :file => file }}
    
    assert_response :success
    
    assert_equal comment, assigns(:asset).comment
    assert assigns(:asset).file.path
    assert_equal asset.uuid, assigns(:asset).uuid
  end

  test "should add comment to existing asset" do
    comment = "test"
    file = fixture_file_upload('Example.jpg', 'image/jpeg')
    
    asset = Asset.create( :file => file )
    post :create, { :asset => { :uuid => asset.uuid, :comment => comment }}
    
    assert_response :success
    
    assert_equal comment, assigns(:asset).comment
    assert assigns(:asset).file.path    
    assert_equal asset.uuid, assigns(:asset).uuid
  end



  
end
