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
    p 'About to send terms and conditions'
  end
end
