class ChallengeParticipationsController < ApplicationController
  def index
    @challenge_participations = ChallengeParticipation.all
  end

  def show
    @challenge_participation = ChallengeParticipation.find params[:id]
  end
end
