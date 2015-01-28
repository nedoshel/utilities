class VotingsController < ApplicationController

  def index
    @buildings = current_user.buildings
    @user_buildings = current_user.user_buildings.to_a
    @active_votings = current_user.building_votings.active
  end

  def new
    @voting = Voting.new user_id: current_user.id
  end

  def create
    @voting = Voting.new voting_params
    if @voting.save
      redirect_to voting_path(@voting), notice: 'Голосование успешно создано'
    else
      render :new
    end
  end

  def show
    @voting = Voting.find params[:id]
  end


  private

    def voting_params
      params.require(:voting).permit(:user_id, :description, :title, :start_at, :end_at, :attachment, :notify_all, :is_published, :building_id)
    end
end
