class Stores::ReviewsController < ApplicationController
  before_action :set_stores_review, only: [:show, :edit, :update, :destroy]

  # GET /stores/reviews
  # GET /stores/reviews.json
  def index
    @stores_reviews = Stores::Review.all
  end

  # GET /stores/reviews/1
  # GET /stores/reviews/1.json
  def show
  end

  # GET /stores/reviews/new
  def new
    @stores_review = Stores::Review.new
  end

  # GET /stores/reviews/1/edit
  def edit
  end

  # POST /stores/reviews
  # POST /stores/reviews.json
  def create
    @stores_review = Stores::Review.new(stores_review_params)

    respond_to do |format|
      if @stores_review.save
        format.html { redirect_to @stores_review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @stores_review }
      else
        format.html { render :new }
        format.json { render json: @stores_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/reviews/1
  # PATCH/PUT /stores/reviews/1.json
  def update
    respond_to do |format|
      if @stores_review.update(stores_review_params)
        format.html { redirect_to @stores_review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @stores_review }
      else
        format.html { render :edit }
        format.json { render json: @stores_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/reviews/1
  # DELETE /stores/reviews/1.json
  def destroy
    @stores_review.destroy
    respond_to do |format|
      format.html { redirect_to stores_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stores_review
      @stores_review = Stores::Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stores_review_params
      params.require(:stores_review).permit(:liked, :critic, :user_id, :store_id)
    end
end
