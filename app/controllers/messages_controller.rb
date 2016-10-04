class MessagesController < ApplicationController


  def create
    render json: { success: true }

    text = params[:text]
    name = params[:name]
    src = params[:account]
    event = params[:notification_type]
    external_contact_id =  params[:external_contact_id]
    account_type = params[:account_type]

  end
end
