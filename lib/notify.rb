class Notify

  def self.send_messages contact, texts, options=nil
    texts.each_with_index do |text,idx|
      options_sent = (idx == texts.length - 1) ? options : nil
      self.send_message contact, text, options_sent
    end
  end

  def self.send_message contact, text, options=nil
    client = self.client(contact)
    response = client.send_message contact.external_id, text, options
    Rails.logger.debug "Response: #{response}"
    return JSON.parse(response.body)['id']
  end

  def self.client(contact)
    if contact.is_telegram?
      return OngairRuby::ClientV2.new(Rails.application.secrets.ongair_telegram_token)
    elsif contact.is_messenger?
      return OngairRuby::ClientV2.new(Rails.application.secrets.ongair_messenger_token)
    end
  end

end
