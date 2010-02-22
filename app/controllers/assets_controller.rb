class AssetsController < ApplicationController
  
  def index
    @asset = Asset.new
    @assets = Asset.all( :limit => 16, :order => "created_at DESC")
    render( :partial => @assets) and return if request.xhr?
  end
  
  def show
  end
  
  def create
    @asset = Asset.find_or_initialize_by_uuid(params[:asset][:file_id])
    @asset.update_attributes(params[:asset])
        
    render :text => "File successfully uploaded <br>#{@asset.file.path}", :status => 201
  rescue => e    
    render :text => "Error with uploading File: #{e.message}", :status => 404
  end
  
end
