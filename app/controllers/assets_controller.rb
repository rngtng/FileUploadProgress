class AssetsController < ApplicationController

  def index
    @assets = Asset.all( :limit => 16, :order => "created_at DESC")
    render @assets and return if request.xhr?
  end

  def show
    @asset = Asset.find_by_id( params[:id] )
    render @asset if request.xhr?
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.find_or_initialize_by_uuid(params[:asset][:uuid])
    @asset.update_attributes(params[:asset])

    render @asset
  rescue => e
    render :text => "Error with uploading File: #{e.message}", :status => 500
  end

end
