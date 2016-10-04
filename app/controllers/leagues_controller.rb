class LeaguesController < ApplicationController

  ##
  # GET /leagues.json
  def index
    @leagues = League.all
    render json: @leagues
  end

  def create
    @league = League.new(league_params)
    if @league.save
      render json: @league
    else
      render json: { success: false }
    end
  end

  private
    def league_params
      params.permit(:name, :code)
    end
end
