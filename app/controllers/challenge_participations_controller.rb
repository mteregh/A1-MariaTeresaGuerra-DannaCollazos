class ChallengeParticipationsController < ApplicationController
  before_action :set_challenge_participation_params, only: [ :create ]
  load_and_authorize_resource

  def index
  end

  def show
  end

  def create
    @challenge_participation = ChallengeParticipation.new(user: current_user, challenge_id: params[:challenge_id], joined_at: Time.now)
    if @challenge_participation.save
      redirect_to challenge_path(@challenge_participation.challenge), notice: "Joined Challenge"
    else
      flash[:error] = "Can't join challenge"
      redirect_to challenges_path
    end
  end

  def update
    if @challenge_participation.updated_at.today?
      flash[:error] = "Already registered progress, register new progress tomorrow"
      return redirect_to challenge_path(@challenge_participation.challenge)
    end
    @challenge_participation.total_points += 1
    if @challenge_participation.save
      redirect_to challenge_path(@challenge_participation.challenge), notice: "Registered progress"
    else
      flash[:error] = "Can't update"
      redirect_to challenges_path
    end
  end

  def destroy
    if @challenge_participation.destroy
      redirect_to challenge_path(@challenge_participation.challenge), notice: "Leaved Challenge"
    else
      flash[:error] = "Can't leave challenge"
      redirect_to challenges_path
    end
  end

  private

    def set_challenge_participation_params
      params.require(:challenge_id)
    end
end
