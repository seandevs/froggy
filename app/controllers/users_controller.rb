class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  before_filter :check_user, :only => [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @frogs_submitted = @user.frogs.find(:all, :order => 'frogs.id DESC')
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'You Have Successfully Registered - Please Login Now'
      redirect_to new_session_path
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Your user has been updated - Holla'
        redirect_to user_path(@user)
      else
        render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
    def check_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = 'ah ah ah...you didnt say the magic word'
        redirect_to frogs_path
      end
    end
end


