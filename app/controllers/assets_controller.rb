class AssetsController < ApplicationController
  
  def index
    @assets = Asset.all( :limit => 16, :order => "created_at DESC")
  end
  
  def create
    @asset = Asset.create(params[:asset])
    flash[:message] = "File successfully uploaded"
  rescue
    flash[:error] = "Error with uploading File"
  ensure
    redirect_to assets_path
  end
  
end
