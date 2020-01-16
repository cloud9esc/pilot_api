class CommentsController < ApplicationController
  before_action :set_review
  before_action :set_review_item, only: %i[show update destroy]

  # GET /reviews/:review_id/comments
  def index
    json_response(@review.comments)
  end

  # GET /reviews/:review_id/comments/:id
  def show
    json_response(@comment)
  end

  # POST /reviews/:review_id/comments
  def create
    @review.comments.create!(comment_params)
    json_response(@review, :created)
  end

  # PUT /reviews/:review_id/comments/:id
  def update
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE /reviews/:review_id/comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:commenter, :content)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_review_item
    @comment = @review.comments.find_by!(id: params[:id]) if @review
  end
end
