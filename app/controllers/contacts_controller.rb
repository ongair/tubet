class ContactsController < ApplicationController

  def index
    render json: Contact.all
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.delete
    render json: { success: true }
  end

end
