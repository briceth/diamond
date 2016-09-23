class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @activities = Activity.all
    # @sports = Activity.where(category: "sports")
  end
end
