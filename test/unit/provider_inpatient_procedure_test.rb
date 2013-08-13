require 'test_helper'

class ProviderInpatientProcedureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProviderInpatientProcedure.new.valid?
  end
end
