class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    if user&.valid_password?(params[:user][:password])
      sign_in(user)
      render json: { message: 'Logged in successfully.', data: user }
    else
      render json: { message: 'Invalid email or password.' }, status: :unauthorized
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if current_user
      sign_out(current_user)
      render json: { message: 'Logged out successfully.' }
    else
      render json: { message: 'You need to sign in or sign up before continuing.' }, status: :unprocessable_entity
    end
  end

  private

  def respond_with(_resource, _opts = {})
    current_user ? log_in_success : log_in_failure
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                               ENV.fetch('DEVISE_JWT_SECRET_KEY')).first

      current_user = User.find(jwt_payload['sub'])

      current_user ? log_out_success : log_out_failure
    else
      log_out_failure
    end
  end

  def log_in_success
    render json: {
      status: 200,
      message: 'Logged in sucessfully.',
      data: UserSerializer.new(current_user)
    }, status: :ok
  end

  def log_in_failure
    render json: {
      status: 401,
      message: "Logged in failure. #{resource.errors.full_messages.to_sentence}",
      data: UserSerializer.new(current_user)
    }, status: :unauthorized
  end

  def log_out_success
    render json: {
      status: 200,
      message: 'Logged out sucessfully.'
    }, status: :ok
  end

  def log_out_failure
    render json: {
      status: 401,
      message: 'Logged out failure.'
    }, status: :unauthorized
  end
end
