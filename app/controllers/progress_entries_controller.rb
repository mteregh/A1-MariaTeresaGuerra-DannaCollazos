class ProgressEntriesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def create
    if @progress_entry.save
      redirect_to challenge_path(@progress_entry.challenge)
    else
      flash[:error] = "Can't create progress entry"
      redirect_to challenge_path(@progress_entry.challenge)
    end
  end

  def update
    @progress_entry.quantity = progress_entry_params[:quantity]
    if @progress_entry.save
      redirect_to challenge_path(@progress_entry.challenge)
    else
      flash[:error] = "Can't update progress entry"
      redirect_to challenge_path(@progress_entry.challenge)
    end
  end

  def destroy
    if @progress_entry.destroy
      redirect_to challenge_path(@progress_entry.challenge)
    else
      flash[:error] = "Can't update progress entry"
      redirect_to challenge_path(@progress_entry.challenge)
    end
  end

  private
    def progress_entry_params
      params.require(:progress_entry).permit(:challenge_id, :quantity)
    end
end
