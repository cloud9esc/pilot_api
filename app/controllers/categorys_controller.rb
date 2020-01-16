class CategorysController < ApplicationController
  before_action :set_category, only: %i[update destroy]

  # GET /categorys
  def index
    @categorys = Category.all
    json_response(@categorys)
  end

  # POST /categorys
  def create
    @category = Category.create!(category_params)
    json_response(@category, :created)
  end

  # PUT /categorys/:id
  def update
    @category.update(category_params)
    head :no_content
  end

  # DELETE /categorys/:id
  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    # whitelist params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
