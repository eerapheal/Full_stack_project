class Api::V1::ReservationsController < ApplicationController
  # CSRF Token Validations SKIP
  protect_from_forgery with: :null_session
  def reserve
    # add an instance of reservation
    reservation = Reservation.new(city: params[:city], start_date: params[:start_date],
                                  end_date: params[:end_date], users_id: params[:users_id],
                                  motorcycles_id: params[:motorcycles_id])
    # Check validation
    if !reservation.valid?
      render status: 400, json: { message: 'O0ops Bad request.', status: 400 }
    elsif reservation.save
      # If it is valid save
      render status: 201, json: { message: 'Reservation made successfully.', data: reservation, status: 201 }
    else
      render status: 500, json: { message: 'O0ops Something went wrong please try again later.', status: 500 }
    end
  end

  def checkout
    # Check for availablity
    reservation = Reservation.find_by(id: params[:id])
    if reservation.nil?
      render status: 404, json: { message: 'O0ops no current Reservation', status: 404 }
    elsif reservation.destroy
      # If Available destroy
      render status: 200, json: { message: 'O0ops Reservation have been removed', status: 200 }
    else
      render status: 500, json: { message: 'O0ops Something went wrong please try again later.', status: 500 }
    end
  end
end
