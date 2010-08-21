require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  test "Relationship.suggested" do
    suggested_users = Relationship.suggested(users(:two))
    assert suggested_users.include?(users(:one))
    assert !suggested_users.include?(users(:two))
  end
end
