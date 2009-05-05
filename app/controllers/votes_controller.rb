class VotesController < ApplicationController
  def create
    @frog = Frog.find(params[:frog_id])
    @frog.votes.create
  end

end
