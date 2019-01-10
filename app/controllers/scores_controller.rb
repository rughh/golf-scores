class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :prevent_snooping, only: [:index, :create]

  def index
    @scores = Score.all
  end

  def create
    Score.find_or_create_by(name: score_attributes[:name]).update(score_attributes)
    head 201
  end

  def show
    @score = Score.find(params[:id])
  end

  private

  def score_attributes
    params.require(:score).permit(:name, holes: [:body, :incomplete])
  end
end
