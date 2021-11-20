class UsersController < ApplicationController
    def create
        @user = User.new(user_params)

        authorize @user
    
        if @user.save
            redirect_to edit_user_path, notice: "Your profile has been successfully created"
        else
            render :new
        end
    end

    def new
        @user = User.new
        authorize @user
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def show
        @renter = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :role,
            :email,
            :description,
            :address,
            :postal_code,
            :phone_number
        )
    end 


end
