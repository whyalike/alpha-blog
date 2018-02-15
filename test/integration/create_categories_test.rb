require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    # Assert template from categories/new to user
    assert_template 'categories/new'
    # To actually create a category
    #There should be a difference when new category is created
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    #Send user to index
    assert_template 'categories/index'
    #Display that category has been created
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in failure" do
    get new_category_path
    # Assert template from categories/new to user
    assert_template 'categories/new'
    # To actually create a category
    #There should be no difference when new category is created
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    #Send user back to new
    assert_template 'categories/new'
    #To look for existence of errors
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end