require 'test_helper'

class OutpatientProcedureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OutpatientProcedure.new.valid?
  end
end
