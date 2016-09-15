class ProposalsController < ApplicationController
  before_action :set_activity

  def index
    @proposals = Proposal.all
    @proposal = Proposal.new
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end


  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.activity = @activity #une proposal belongs to  activity_id
      if @proposal.save
        redirect_to activity_proposals_path
      else
        render :new
    end
  end

  def destroy
    @proposal = Proposal.find(params[:id])
  end

  def upvote
    @proposal = proposal.find(params[:id])
    if current_user.voted_for? @proposal
      current_user.unvote_for @proposal
    else
     current_user.up_votes @proposal
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id]) #on a besoin de choper l'activity_id car proposal est nesté dans activity
  end

  def proposal_params
    params.require(:proposal).permit(:subject, :content, :location, :price, :activity_id)
  end
end
