class ParticipantsController < ApplicationController
  include UrlHelper
  before_action :set_participant, only: [:show]

  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # POST /participants
  # POST /participants.json
  def create
    saved = false
    Participant.transaction do
      microsite = save_microsite(microsite_params)
      @participant = Participant.new(participant_params)
      @participant.microsite = microsite
      saved = @participant.save
    end

    respond_to do |format|
      if saved
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render json: {success: true, participant_id: @participant.id}, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:first_name, :last_name, :email, :country_code)
    end

    def save_microsite(microsite_params)
      name = microsite_params['name']
      Microsite.find_or_create_by(name: name)
    end

    def microsite_params
      params.require(:microsite).permit(:name)
    end
end
