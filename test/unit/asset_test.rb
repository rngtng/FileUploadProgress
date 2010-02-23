require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  
  test "new asset has uuid set" do
    asset = Asset.new
    assert asset.uuid.present?
  end

  test "different assets shoud have different uuid set" do
    asset1 = Asset.new
    asset2 = Asset.new
    assert_not_equal  asset1.uuid, asset2.uuid
  end
  
end
