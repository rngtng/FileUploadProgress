require 'test_helper'

class AssetsControllerTest < ActionController::TestCase

  test "should show index" do
    
    get :index
    assert_response :success
  end
  
end
