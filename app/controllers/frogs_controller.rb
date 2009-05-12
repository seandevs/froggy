class FrogsController < ApplicationController
  before_filter :login_required
  before_filter :check_frog, :only => [:destroy, :edit, :update]
  def index
    @frogs = Frog.find(:all, :order => 'frogs.id DESC')
    @users = User.find(:all)
    @frog = Frog.new
  end

  def show
    @frog = Frog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frog }
    end
  end

  def new
    @frog = Frog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frog }
    end
  end

  def edit
    @frog = Frog.find(params[:id])
  end

  def create
    @frog = @current_user.frogs.build params[:frog]
    if @frog.save
      #flash[:notice] = 'Your new frog has been added - Holla'
      #redirect_to frogs_path
    else
      render :action => 'new'
    end
  end

  def update
    @frog = Frog.find(params[:id])
    if @frog.update_attributes(params[:frog])
      flash[:notice] = 'Your frog has been updated - Holla'
      redirect_to frogs_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @frog = Frog.find(params[:id])
    #@frog = @current_user.frogs.find(params[:id])
    @frog.destroy

    respond_to do |format|
      format.html { }
      format.js { render :nothing => true }
    end
  end
  
  protected
  def check_frog
    if Frog.find(params[:id]).user.id != @current_user.id
      flash[:notice] = 'ah ah ah...you didnt say the magic word'
      redirect_to frogs_path
    end
  end  
end
