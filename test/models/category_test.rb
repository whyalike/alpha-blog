require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    # Runs before everyone of test
    @category = Category.new(name: "sports")
  end
  
  
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "name should be present" do 
    @category.name = " "
    # Negative assertion
    # Is the category not valid?
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    # Hit the test database
    @category.save
    category2 = Category.new(name: "sports")
    #Category2 should not be valid
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end