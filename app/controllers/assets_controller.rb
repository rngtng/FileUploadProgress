class AssetsController < ApplicationController
  
  def index
    @assets = Asset.all( :limit => 16, :order => "created_at DESC")
    render @assets and return if request.xhr?
  end

  def new
    @asset = Asset.find_by_id( params[:id] )
  end
  
  def new
    @asset = Asset.new
  end
  
  def create
    @asset = Asset.find_or_initialize_by_uuid(params[:asset][:uuid])
    @asset.update_attributes(params[:asset])
        
    render :text => "File successfully uploaded <br>#{@asset.file.path}", :status => 201
  rescue => e    
    render :text => "Error with uploading File: #{e.message}", :status => 404
  end
  
end
