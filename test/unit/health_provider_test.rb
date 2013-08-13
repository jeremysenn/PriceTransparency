require 'test_helper'

class HealthProviderTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert HealthProvider.new.valid?
  end
end
