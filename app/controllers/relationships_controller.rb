class RelationshipsController < ApplicationController
    before_action :authorize!

    def create
        @relationship = Relationship.new(relationship_params)
        @user = User.find(params[:relationship][:partner_id])
        if @relationship.save 
            render json: @user, status: :ok
        else
            render json:{ :errors => @relationship.errors.full_messages }, status: :bad_request
        end
    end

    def update
        @relationship = Relationship.find(params[:id])
        @user = User.find(@relationship.partner_id)
        @relationship.update(relationship_params)
        if @relationship.confirmed === 1
            @relationship.create_inverse(params[:relationship][:confirmed])
        else
            @relationship.destroy
        end
    end

    private 

    def relationship_params
    params.require(:relationship).permit(:user_id, :partner_id, :confirmed)
    end
end
