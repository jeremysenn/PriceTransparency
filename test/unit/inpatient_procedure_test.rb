require 'test_helper'

class InpatientProcedureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert InpatientProcedure.new.valid?
  end
end
