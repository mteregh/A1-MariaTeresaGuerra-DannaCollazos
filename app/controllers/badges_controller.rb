class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.order(:id)
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to @badge, notice: "Badge creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to @badge, notice: "Badge actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path, notice: "Badge eliminado."
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name)
  end
end
