class UserDatesController < ApplicationController
    before_action :authorize!, only: [:index, :show, :create, :update, :destroy]


    def index
        @user = User.find(params[:query])
        @user_dates = UserDate.where(user: @user)
    end

    def create
        @user = User.find(current_user.id)
        @user_date = UserDate.new(user: @user, time: params[:datePlan][:dateTime])
        if @user_date.save
            if params[:datePlan][:activities].length > 0
                params[:datePlan][:activities].each do |activity|
                    dateEvent = DateEvent.new(name: activity[:name], street_address: activity[:location][:display_address].join(' '), price: activity[:price], image_url:activity[:image_url])
                    @user_date.date_events << dateEvent
                end
            else
                return render json: {errors: ["You must select an activity"]}, status: :bad_request 
            end
            if params[:datePlan][:partners].length > 0
                params[:datePlan][:partners].each do |partner|
                    @partner = User.find(partner[:id])
                    datePartner = DatePartner.new(user: @partner)
                    @user_date.date_partners << datePartner
                end
            else
            return render json: {errors: ["You must select a partner"]}, status: :bad_request
            end
            render json: @user_date, status: :ok
        else
            render json: {errors: ["You must select a date from the calendar"]}
        end
    end

    def update
        @user_date = UserDate.find(params[:datePlan][:id])
        if params[:datePlan][:dateTime]
        @user_date.update(time: params[:datePlan][:dateTime] )
        end
        if params[:datePlan][:activities]
            @user_date.date_events.destroy_all
            params[:datePlan][:activities].each do |activity|
                dateEvent = DateEvent.new(name: activity[:name], street_address: activity[:address], price: activity[:price], image_url: activity[:image_url])
                @user_date.date_events << dateEvent
                end
            else
                return render json: {errors: ["You must select an activity"]}, status: :bad_request 
            end
        if params[:datePlan][:partners]
            @user_date.date_partners.destroy_all
            params[:datePlan][:partners].each do |partner|
                @partner = User.find(partner[:id])
                datePartner = DatePartner.new(user: @partner)
                @user_date.date_partners << datePartner
                end
            else
                return render json: {errors: ["You must select a partner"]}, status: :bad_request
            end
        if params[:datePlan][:rating]
            @user_date.rating = params[:datePlan][:rating]
        end
            @user = User.find(current_user.id)
            @user_dates = UserDate.where(user: @user)
            @user_dates
        end

    def destroy
        @user_date = UserDate.find(params[:id])
        @user_date.destroy
        # render json: {'Access-Control-Allow-Origin' => 'localhost:3001'}
    end
end
