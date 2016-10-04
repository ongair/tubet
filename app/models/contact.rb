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
  validates :external_id, presence: true
  validates :source, presence: true
end
