class Api::Lunabase::ContactsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_contact, only: [:show]

    def index
        @contact = Contact.all
    end

    def create
        @contact = Contact.create(contact_params)
        if @contact.save
            render :show, status: :created
        else
          head(:unprocessable_entity)
        end
    end

    def show

    end


    private

    def set_contact
        @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :project_description, :interest)
    end
end
