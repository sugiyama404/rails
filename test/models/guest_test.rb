# frozen_string_literal: true

class GuestTest < ActiveSupport::TestCase
  def setup
    @guest = ::Guest.new(name: 'Example User', email: 'user@example.com', password_digest: 'pass')
  end
  test 'should be valid' do
    assert @guest.valid?
  end
end
