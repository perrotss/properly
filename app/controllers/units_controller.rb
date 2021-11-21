class UnitsController < ApplicationController

    def show
        properties = current_user.properties
        properties.each do |property|
        @property = Property.find(params[:property_id])
        @unit = Unit.find(params[:id])
        end
    end

    def lease
        @unit = Unit.find(params[:id])
        send_data @unit.lease, filename: "unit-lease-#{@unit.unit_number}.pdf", type: :pdf, disposition: :inline
    end

    def new
        @unit = Unit.new
        @property = property.find(params[:property_id])
    end
    
    
def create
    @unit = Unit.new(params_unit)
    @property = Property.find(params[:property_id])
    @unit.property = @property
    @unit.lease = params[:unit][:lease].read unless @unit.lease.nil?

    if @unit.save
        redirect_to properties_path
    else
        render :new
    end
end
    
    def edit
        @property = property.find(params[:property_id])
        @unit = Unit.find(params[:id])
    end
    
    def update
        @unit = Unit.find(params[:id])
        @property = property.find(params[:property_id])
        @unit.property = @property
    
        if params[:unit][:lease]
        @unit.lease = params[:unit][:lease].read
        end
    
        if @unit.update(params_unit)
        redirect_to property_unit_path(@property, @unit)
        else
        render :edit
        end
    end
    
    def destroy
        @unit = Unit.find(params[:id])
        @unit.destroy
        redirect_to root_path
    end
    
    private
    def params_unit
        params.require(:unit).permit(:unit, :bathrooms, :bedrooms, :square_meters, :purchase_price, :payment_method, :renewal_date, :rent_amount_cents, :payment_date, photos: [])
    end
    end
end
