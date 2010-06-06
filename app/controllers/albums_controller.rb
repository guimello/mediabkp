class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_album, :except => [:new, :create, :index]
  
  def get_album
    @album = @user.albums.find(params[:id])
  end

  # GET /albums
  # GET /albums.xml
  def index
    @albums = @user.albums.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = @user.albums.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit    
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = @user.albums.new params[:album]

    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to([@user,@album]) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to([@user, @album]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(user_albums_url(@user)) }
      format.xml  { head :ok }
    end
  end
end
