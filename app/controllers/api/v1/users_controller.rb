class Api::V1::UsersController < ApplicationController
  # CSRF Token Validations SKIP
  protect_from_forgery with: :null_session
  def login
    # Check available user
    user = User.find_by(name: params[:name])
    if user.nil?
      render status: 403, json: { message: 'User does not exist Login to continue.', status: 403 }
    else
      render status: 200, json: { message: 'Login success', status: 200, data: user }
    end
  end

  def register
    user = User.find_by(name: params[:name])

    if user.nil?
      user = User.new(name: params[:name])

      if user.save
        render status: 201,
               json: { message: 'you are successfuly register.', id: user.id, name: user.name,
                       status: 201 }
      else
        render status: 500, json: { message: 'Something went wrong please try again later.', status: 500 }
      end
    else
      render status: 200, json: { message: 'User already exist.', id: user.id, name: user.name,
                                  status: 200 }
    end
  end

  def reservations
    user = User.find_by(id: params[:id])
    if user.nil?
      render status: :not_found, json: { message: 'No active user', status: :not_found }
    else
      reservations = Reservation.where(user_id: params[:id])
      render status: :ok, json: { message: 'Active Reservation found', data: reservations, status: :ok }
    end
  end
end