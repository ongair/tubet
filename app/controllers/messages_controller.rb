class MessagesController < ApplicationController

  before_action :get_contact, only: [:create]

  def create
    render json: { success: true }
    process_text(params[:text])
  end

  private
    def get_contact
      @contact = Contact.find_by(external_id: params[:external_contact_id], source: params[:account_type])
      if !@contact && params[:notification_type] == 'MessageReceived'
        @contact = Contact.create! external_id: params[:external_contact_id], source: params[:account_type], name: params[:name], state: 'new'
        puts @contact
      end
    end

    def process_text text
    end
end
