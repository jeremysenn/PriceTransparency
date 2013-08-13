require 'test_helper'

class StateOutpatientProcedureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StateOutpatientProcedure.new.valid?
  end
end
