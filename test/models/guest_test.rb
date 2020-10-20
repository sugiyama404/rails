# frozen_string_literal: true

# require_relative 'test_helper'
require '/home/circleci/sampleApp/test/test_helper'

class GuestTest < ActiveSupport::TestCase
  def setup
    @guests = Guest.new(name: 'Example User', mail: 'user@example.com', password_digest: '$2a$12$1x.Cb8Tb3vR5SLt/1edWteuWhoRIJukaIOk4Gqaq7LvEJFD7B7kl.')
  end
  test 'should be valid' do
    assert @guests.valid?
  end
end
