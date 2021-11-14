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
end
