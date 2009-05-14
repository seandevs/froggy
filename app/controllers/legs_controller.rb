class LegsController < ApplicationController
  before_filter :login_required
  
  def create
    @frog = Frog.find(params[:frog_id])
    @leg = @frog.legs.create!(params[:leg])
    respond_to do |format|
      format.html { redirect_to @frog}
      format.js
    end
  end
end