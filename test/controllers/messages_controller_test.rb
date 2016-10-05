require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  test "Can register a player" do

    stub_request(:post, "https://ongair.im/api/v1/base/send")
      .with(body: hash_including({ external_id: '1234567890' }))
      .to_return(:status => 200, body: { sent: true, id:2935 }.to_json, :headers => {})

    post :create, params: { text: "/start", name: "Cotton(@wood)", source: "@TubetBot", account_type: "Telegram", notification_type: "MessageReceived", external_contact_id: '1234567890' }, format: 'json'
    assert_response :success

    contact = Contact.find_by(external_id: '1234567890', source: 'Telegram')
    assert_not_nil contact
    assert_not contact.terms_accepted
    assert_equal 'terms', contact.state
    assert_equal 'Cotton', contact.name
  end

end
