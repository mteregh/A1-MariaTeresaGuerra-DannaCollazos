class ChallengesController < ApplicationController
  before_action :set_challenge, only: [ :show, :edit, :update, :destroy ]
  load_and_authorize_resource

  def index
    @challenges = @challenges.includes(:user).order(:id)
  end

  def show; end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    if @challenge.save
      redirect_to @challenge, notice: "Challenge creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: "Challenge actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_path, notice: "Challenge eliminado."
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :description, :start, :end)
  end
end
