require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  test "Can register a player" do

    Notify.expects(:send_messages)

    post :create, params: { text: "/start", name: "Cotton(@wood)", source: "@TubetBot", account_type: "Telegram", notification_type: "MessageReceived", external_contact_id: '1234567890' }, format: 'json'
    assert_response :success

    contact = Contact.find_by(external_id: '1234567890', source: 'Telegram')
    assert_not_nil contact
    assert_not contact.terms_accepted
    assert_equal 'terms', contact.state
    assert_equal 'Cotton', contact.name
  end

end
