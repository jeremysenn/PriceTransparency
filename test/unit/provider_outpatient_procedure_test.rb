require 'test_helper'

class ProviderOutpatientProcedureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProviderOutpatientProcedure.new.valid?
  end
end
