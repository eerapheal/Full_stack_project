class Api::V1::MotorcyclesController < ApplicationController

  # before_action to call the set_motorcycle method, you can avoid repeating the same code in each of the show, update, and destroy actions, which can help keep your code DRY
  before_action :set_motorcycle, only: %i[show update destroy]

  # When a user requests the endpoint (e.g. by visiting /motorcycles), they will receive a JSON response with all the motorcycle records.
  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end

# When a user requests this endpoint (e.g. by visiting /motorcycles/1), they will receive a JSON response with the motorcycle record that has an id of 1.
  def show
    render json: @motorcycle
  end

  # It creates a new Motorcycle object with the attributes specified in the motorcycle_params method, which is usually a private method defined in the same controller.
  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    if @motorcycle.save
      render json: @motorcycle, status: :created, location: api_v1_motorcycle_url(@motorcycle)
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end
# this action will attempt to update the existing motorcycle record with the new attributes specified in the motorcycle_params method
  def update
    if @motorcycle.update(motorcycle_params)
      render json: @motorcycle
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
# This action could be used to handle a request to delete an existing motorcycle record. When a user submits a request to delete a motorcycle (e.g. by clicking on a "Delete" button or sending a DELETE request to /motorcycles/:id)
  def destroy
    if @motorcycle.nil?
      render json: { error: 'Motorcycle not found' }, status: :not_found
    else
      @motorcycle.reservations.destroy_all
      @motorcycle.destroy
      head :no_content
    end
  end

  
  private

  #method is used as a before_action callback method, which means it is called before certain controller actions
  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'O0op Motorcycle not found' }, status: :not_found
  end

  #The motorcycle_params method is a private helper method that is used to extract and sanitize the parameters passed in the request for creating or updating a motorcycle record.
  def motorcycle_params
    params.require(:motorcycle).permit(:name, :image, :price, :description, :model, :available)
  end
end
