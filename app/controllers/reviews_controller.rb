class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]

  # GET /reviews
  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  # POST /reviews
  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  # GET /reviews/:id
  def show
    json_response(@review)
  end

  # PUT /reviews/:id
  def update
    @review.undiscard(review_params)
    head :no_content
  end

  # DELETE /reviews/:id
  def destroy
    @review.discard
    # redirect_to users_url, notice: "Review removed"
    head :no_content
  end

  private

  def review_params
    # whitelist params
    params.permit(:title, :author)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
