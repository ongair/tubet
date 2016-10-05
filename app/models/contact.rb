# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  phone_number    :string
#  source          :string
#  profile_pic_url :string
#  external_id     :string
#  state           :string
#  level           :string
#  credits         :integer
#  terms_accepted  :boolean
#  beta            :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# require 'lib/notify.rb'
class Contact < ApplicationRecord
  include AASM

  validates :external_id, presence: true
  validates :source, presence: true

  aasm :column => :state do
    state :new, initial: true do
      event :accept do
        transitions :from => [:new], :to => :accepted
      end
    end

    state :terms, :before_enter => :send_terms_and_conditions do

    end

    state :accepted do
    end

    event :send_terms do
      transitions :from => :new, :to => :terms
    end
  end

  def send_terms_and_conditions
    level = '0'
    credits = 0

    messages = [
      I18n.t('welcome', name: self.name),
      I18n.t('disclaimer')
    ]

    logger.debug "Sending terms and conditions to #{self.external_id}"
    logger.debug messages

    options = "#{I18n.t('agree')},#{I18n.t('disagree')}"
    Notify.send_messages self, messages, options
  end

  def is_telegram?
    source == 'Telegram'
  end

  def is_messenger?
    source == 'MessengerV2'
  end
end
