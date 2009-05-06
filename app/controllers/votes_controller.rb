class VotesController < ApplicationController
  def create
    @frog = Frog.find(params[:frog_id])
    @frog.votes.create
  end
  
  def destroy
    #@frog = Frog.find(params[:frog_id])
    #@frog.votes.destroy
    @frog = Frog.find(params[:id])
    @vote = @frog.votes.find(:last)
    @vote.destroy
  end

end
