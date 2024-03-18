class MatchController < ApplicationController
    before_action :set_match, only: [:show, :update]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def set_match
        @match = Match.find(params[:id])
    end

    def match_params
        params.require(:match).permit(:matchA, :matchB, :state, :result)
    end

    def create
        match = Match.new(match_params)
        if match.save
            render json: match, status: :created
        else
            render json: match.errors, status: :unprocessable_entity
        end
    end

    def index
        @matches = Match.all
        render json: @matches
    end

    def show
        match = Match.find(params[:id])
        render json: match
    end

    def update
        match = Match.find(params[:id])
        if match.update(match_params)
            render json: match, status: :ok
        else
            render json: match.errors, status: :unprocessable_entity
        end
    end

    def record_not_found
        render json: { error: 'Match not found' }, status: :not_found
    end
end
