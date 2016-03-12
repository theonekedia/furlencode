class Users::VisitsController < ApplicationController
  before_action :set_users_visit, only: [:show, :edit, :update, :destroy]

  # GET /users/visits
  # GET /users/visits.json
  def index
    @users_visits = Users::Visit.all
  end

  # GET /users/visits/1
  # GET /users/visits/1.json
  def show
  end

  # GET /users/visits/new
  def new
    @users_visit = Users::Visit.new
  end

  # GET /users/visits/1/edit
  def edit
  end

  # POST /users/visits
  # POST /users/visits.json
  def create
    @users_visit = Users::Visit.new(users_visit_params)

    respond_to do |format|
      if @users_visit.save
        format.html { redirect_to @users_visit, notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @users_visit }
      else
        format.html { render :new }
        format.json { render json: @users_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/visits/1
  # PATCH/PUT /users/visits/1.json
  def update
    respond_to do |format|
      if @users_visit.update(users_visit_params)
        format.html { redirect_to @users_visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_visit }
      else
        format.html { render :edit }
        format.json { render json: @users_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/visits/1
  # DELETE /users/visits/1.json
  def destroy
    @users_visit.destroy
    respond_to do |format|
      format.html { redirect_to users_visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_visit
      @users_visit = Users::Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_visit_params
      params.require(:users_visit).permit(:date, :status)
    end
end
