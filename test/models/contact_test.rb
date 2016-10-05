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

require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "Initial state" do
    player = Contact.new
    assert_equal 'new', player.state
    assert player.new?
    assert player.may_send_terms?
  end

  test "Send terms and conditions" do
    beginner = contacts(:beginner)
    assert beginner.new?

    text = I18n.t 'welcome', name: beginner.name
    disclaimer = I18n.t 'disclaimer'
    options = "#{I18n.t('agree')},#{I18n.t('disagree')}"

    Notify.expects(:send_messages).with(beginner,[text, disclaimer], options)

    beginner.send_terms
    assert_equal 'terms', beginner.state
  end

end