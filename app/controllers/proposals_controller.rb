class ProposalsController < ApplicationController
  before_action :set_activity, only: [:index, :show, :create, :destroy]
  before_action :set_proposal, only: [:upvote]

  def index
    @proposals = Proposal.where(activity_id: @activity)
    @proposal = Proposal.new
  end

  def search
    query = params[:q].presence || "*" #check if the atribute or the variable is present or return the default index
    @proposals = Proposal.search(query, suggest: true) #:q permet de garder l'index de départ par default
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.activity = @activity #a proposal belongs to  activity_id
    @proposal.user = current_user #a proposal belongs to the actual user
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
    if current_user.voted_for? @proposal
      current_user.unvote_for @proposal
    else
     current_user.up_votes @proposal
    end
  end

  def autocomplete
    render json: Proposal.search(params[:term], {
      fields: [{subject: :text_start}],
      limit: 6,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end

  private


  def set_activity
    @activity = Activity.find(params[:activity_id]) #on a besoin de choper l'activity_id car proposal est nesté dans activity
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:subject, :content, :location, :price, :activity_id)
  end
end
