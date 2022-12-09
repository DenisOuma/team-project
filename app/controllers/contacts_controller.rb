class ContactsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  before_action :authorize


  # GET /contacts
  def index
      contacts = Contact.all
      render json: contacts
  end

  # GET /contacts/1
  def show
    contact = find_contact
    render json: contact
  end

  # POST /contacts
  def create 
      contact = Contact.create!(**contact_params, user_id: session[:user_id])
      render json: contact, status: :created
  end

  # PATCH/PUT /contacts/1
  def update 
      #find the id
      contact = find_contact
      #update
      contact.update(contact_params)
      #render json data 
      render json: contact, status: :created
  end


  # DELETE /contacts/1
  def destroy
      contact = find_contact
      contact.destroy
      head :no_content
  end

  private 

  def authorize
    return render json: {errors: ["Please login or sign up"]}, status: :unauthorized unless session.include? :user_id
  end

  def contact_params
      params.require(:contact).permit( :id, :name, :email, :phone)
  end

  def find_contact
    contact = Contact.find_by(id: params[:id])
  end

  def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found_response
      render json: { error: ["Contact not found"] }, status: :not_found
  end
  
end

