class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def update
        client = Client.find_by(id: params[:id])
        client.update(client_params)
        render json: client, status: :accepted
    end

    def show
        client = Client.find_by(id: params[:id])
        if client
            render json: client, status: :ok
        else
            render json: { "client": "not found" }, status: :not_found
        end
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end

end
