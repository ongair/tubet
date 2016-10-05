require 'test_helper'

class NotifyTest < ActiveSupport::TestCase

  test "Can send a single message" do
    disclaimer = I18n.t 'disclaimer'
    beginner = contacts(:beginner)

    stub = stub_request(:post, 'https://ongair.im/api/v1/base/send')
      .with(body: hash_including({ external_id: beginner.external_id, text: disclaimer }))
      .to_return(:status => 200, body: { sent: true, id:2935 }.to_json, :headers => {})

    id = Notify.send_message beginner, disclaimer
    assert_equal 2935, id
    assert_requested stub
  end

  test "Can send multiple messages" do
    messages = ["Hey", "There"]
    beginner = contacts(:beginner)

    stub = stub_request(:post, 'https://ongair.im/api/v1/base/send')
      .with(body: hash_including({ external_id: beginner.external_id }))
      .to_return(:status => 200, body: { sent: true, id:2935 }.to_json, :headers => {})

    Notify.send_messages beginner, messages, "yes,no"

    assert_requested stub, times: 2
  end

end
