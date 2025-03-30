class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:create]

    def index
        @users = User.all
        render json: @users
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                format.json{ render :show, status: :created, location: @user }
            else
                format.json{ render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {:name, :email})
    end

end
