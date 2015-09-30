class Api::V1a::SessionsController < Api::V1a::BaseController
  skip_before_filter :verify_authenticity_token

  def create

    user = User.find_for_database_authentication(email: user_params[:email])
    if user and user.valid_password?(user_params[:password])
      sign_in(user)
      token = JsonWebToken.encode(user_id: current_user.id)
      render json: {token: token, user_info: current_user.get_info}, status: :created
    else
      render json: {errors: { unauthenticated: ["Invalid credentials"] }}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
