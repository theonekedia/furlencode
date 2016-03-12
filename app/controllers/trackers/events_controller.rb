class Trackers::EventsController < ApplicationController
  before_action :set_trackers_event, only: [:show, :edit, :update, :destroy]

  # GET /trackers/events
  # GET /trackers/events.json
  def index
    @trackers_events = Trackers::Event.all
  end

  # GET /trackers/events/1
  # GET /trackers/events/1.json
  def show
  end

  # GET /trackers/events/new
  def new
    @trackers_event = Trackers::Event.new
  end

  # GET /trackers/events/1/edit
  def edit
  end

  # POST /trackers/events
  # POST /trackers/events.json
  def create
    @trackers_event = Trackers::Event.new(trackers_event_params)

    respond_to do |format|
      if @trackers_event.save
        format.html { redirect_to @trackers_event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @trackers_event }
      else
        format.html { render :new }
        format.json { render json: @trackers_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/events/1
  # PATCH/PUT /trackers/events/1.json
  def update
    respond_to do |format|
      if @trackers_event.update(trackers_event_params)
        format.html { redirect_to @trackers_event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @trackers_event }
      else
        format.html { render :edit }
        format.json { render json: @trackers_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/events/1
  # DELETE /trackers/events/1.json
  def destroy
    @trackers_event.destroy
    respond_to do |format|
      format.html { redirect_to trackers_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trackers_event
      @trackers_event = Trackers::Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trackers_event_params
      params.require(:trackers_event).permit(:tracker_id, :event_name, :value, :referrer)
    end
end
