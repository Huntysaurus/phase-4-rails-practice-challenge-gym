class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def create
        gym = Gym.create!(gym_params)
        render json: gym, status: :accepted
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :accepted
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end

end
