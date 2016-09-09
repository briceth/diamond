class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @activities = Activity.all
  end
end
