require 'json_web_token'

class Api::V1a::UsersController < Api::V1a::BaseController
    before_action :authenticate_user!, :except => [:create]
    skip_before_filter :verify_authenticity_token

    def index
        render json: {status: :ok}, status: :created
    end

    def create
        user = User.new(user_params)

        if user.save
            sign_in(user)
            token = JsonWebToken.encode(user_id: current_user.id)
            render json: {token: token, user_info: current_user.get_info}, status: :created
        else
            warden.custom_failure!
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: {user_info: current_user.get_info}
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
