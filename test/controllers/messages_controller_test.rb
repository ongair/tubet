require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  test "Can register a player" do
    post :create, params: { text: "/start", name: "Cotton", source: "@TubetBot", account_type: "Telegram", notification_type: "MessageReceived", external_contact_id: '1234567890' }, format: 'json'
    assert_response :success

    contact = Contact.find_by(external_id: '1234567890', source: 'Telegram')
    assert_not_nil contact
    assert_not contact.terms_accepted
    assert_equal 'new', contact.state
  end

end
