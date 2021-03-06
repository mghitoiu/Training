class TeamsController < ApplicationController
  before_action :set_team, only: %i[update show destroy]

  def index
    @teams = Team.all
  end

  def show
    head :not_found unless @team.present?
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      render :show, status: :created
    else
      handle_error(@team.errors)
    end
  end

  def update
    if @team.update(team_params)
      render :show
    else
      handle_error(@team.errors)
    end
  end

  def destroy
    if @team.destroy
      render :head
    else
      handle_error(@team.errors)
    end
  end

  private

  def permitted_params
    params.permit(:id)
  end

  def team_params
    params.require(:team).permit(:name, :abbreviation)
  end

  def set_team
    @team = Team.find(permitted_params[:id])
  end
end