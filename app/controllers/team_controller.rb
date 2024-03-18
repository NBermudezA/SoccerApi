class TeamController < ApplicationController

    before_action :set_team, only: [:show, :update]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        team = Team.new(team_params)
        if team.save
            render json: team, status: :created
        else
            render json: team.errors, status: :unprocessable_entity
        end
    end

    #private

    def set_team
        @team = Team.find(params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :stadium, :capacity, :city)
    end

    # GET /teams - List all teams
    def index
        @teams = Team.all
        render json: @teams
    end

    # GET /teams/id - Show the team
    def show
        team = Team.find(params[:id])
        render json: team
    end

    # POST /teams - Update the team
    def update
        team = Team.find(params[:id])
        if team.update(team_params)
            render json: team, status: :ok
        else
            render json: team.errors, status: :unprocessable_entity
        end
    end

    # DELETE /teams/id - Delete the team
    def destroy
        if params[:id].nil?
            Team.destroy_all
            #message_delete = '[]'
        else
            team = Team.find(params[:id])
            team.destroy
            #message_delete = '{}'
        render json: Team.all
        # Falta hacer que retorne [] enves de vacio
        end
    end

    def record_not_found
        render json: { error: 'Team not found' }, status: :not_found
    end
end
