class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    @activity = Activity.find(params[:id])
  end
end
