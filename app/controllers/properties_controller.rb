class PropertiesController < ApplicationController
    def index
        @properties = current_user.buildings
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(params_property)
        @property.user = current_user
        
        if @property.save
            redirect_to properties_path
        else
            render :new
        end
    end

    def edit
        @property = Property.find(params[:id])
    end

    def update
    @property = Property.find(params[:id])

        if Property.update(params_property)
            redirect_to property_path(@property)
        else
            render :edit
        end
    end

    def destroy
        @property = Property.find(params[:id])
        @property.destroy
        redirect_to root_path
    end
    private

    def params_property
        params.require(:property).permit(:address, :purchase_date, :purchase_price, :property_taxes, :buidling_age, :units, :city, :descripton)
    end
end
