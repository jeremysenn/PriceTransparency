require 'test_helper'

class StateInpatientProcedureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StateInpatientProcedure.new.valid?
  end
end
