class RelationshipsController < ApplicationController
    before_action :authorize!

    def create
        @relationship = Relationship.new(relationship_params)
        if @relationship.save 
            render json: @relationship, status: :ok
        else
            render json: @relationship.errors.full_messages
        end
    end

    private 

    def relationship_params
    params.require(:relationship).permit(:user_id, :partner_id, :confirmed)
    end
end
