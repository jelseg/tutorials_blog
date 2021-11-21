require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports") #cretae -> goes to the table

    @admin_user = User.create(username: "MisterAdmin", email: "1@ok.com",
                              password: "password123", admin: true) #note: to use our method sign_in_as we need to always take the same password for all users (have to hardcode it there)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)  #sign in ass is defined in test_helper file
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin_user)
    assert_difference('Category.count',1) do   #asserts when the do part changes the count by 1
      post categories_url, params: { category: { name: "Travel" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    assert_no_difference('Category.count') do   #asserts when the do part doesn't change the count
      post categories_url, params: { category: { name: "Travel" } }
    end

    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category) #here it is important you did create, otherwise it would not be able to create a path
    assert_response :success
  end

=begin
  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: {  } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
=end
end
