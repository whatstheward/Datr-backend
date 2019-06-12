class UserDatesController < ApplicationController
    before_action :authorize!, only: [:index, :show, :create, :update]


    def index
        @user = User.find(current_user.id)
        @user_dates = UserDate.where(user: @user)
    end

    def create
        @user = User.find(current_user.id)
        @user_date = UserDate.new(user: @user, time: params[:datePlan][:dateTime])
        if @user_date.save
            if params[:datePlan][:activities]
                params[:datePlan][:activities].each do |activity|
                    dateEvent = DateEvent.new(name: activity[:name], street_address: activity[:location][:display_address].join(' '), price: activity[:price], image_url:activity[:image_url])
                    @user_date.date_events << dateEvent
                end
            end
            if params[:datePlan][:partners]
                params[:datePlan][:partners][0].each do |partner|
                    @partner = User.find(partner[:id])
                    datePartner = DatePartner.new(user: @partner)
                    @user_date.date_partners << datePartner
                end
            end
            render json: @user_date, status: :ok
        else
            render json: {errors: ['Uh-Oh! Date was not saved']}
        end
    end

    def update
        @user_date = UserDate.find(params[:datePlan][:id])
        if params[:datePlan][:activities]
            params[:datePlan][:activities].each do |activity|
                oldDate = DateEvent.find(activity[:id])
                oldDate.destroy
                dateEvent = DateEvent.new(name: activity[:name], street_address: activity[:address], price: activity[:price], image_url: activity[:image_url])
                @user_date.date_events << dateEvent
                    byebug
                end
            end
        end

    def destroy
        @user_date = UserDate.find(params[:id])
        @user_date.destroy
        render json: {'Access-Control-Allow-Origin' => 'localhost:3001'}
    end
end
