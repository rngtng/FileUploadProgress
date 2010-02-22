class AssetsController < ApplicationController
  
  def index
    @asset_uuid = Asset.generate_uuid
    @assets = Asset.all( :limit => 16, :order => "created_at DESC")
    render( :partial => @assets) and return if request.xhr?
  end
  
  def show
  end
  
  def create
    @asset = Asset.find_or_initialize_by_file_id(params[:asset][:file_id])
    @asset.update_attributes(params[:asset])
        
    flash[:message] = "File successfully uploaded <br>#{@asset.file.path}"
 #   head 200
  rescue => e    
    flash[:error] = "Error with uploading File: #{e.message}"
#    head 404
  ensure
    redirect_to assets_path
  end
  
end
