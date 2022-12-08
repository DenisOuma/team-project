class ContactsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # before_action :authorize

    def index
         contact = Contact.all
         render json: contact
    end


    def show
        contact = find_contact
        render json: contact
      end

    def create 
        contact = Contact.create!(**contact_params, user_id: session[:user_id] )
        render json: contact, status: :created
    end


    def update
        contact = find_contact
        contact.update(contact_params)
        render json: contact

    end

    def destroy
        contact = find_contact
        contact.destroy
        head :no_content
      end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :phone)

         
    end

    # def authorize
    #     return render json: {errors: ["Please login or sign up"]}, status: :unauthorized unless session.include? :user_id
    #   end

    def find_contact
       Contact.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Contact not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
    


end
