require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @admin_user = User.create(username: "MisterAdmin", email: "1@ok.com",
                              password: "password123", admin: true) #note: to use our method sign_in_as we need to always take the same password for all users (have to hardcode it there)
    sign_in_as(@admin_user)
    end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success

    newname = "Haaientanden"

    assert_difference 'Category.count', 1  do
      post categories_path, params: {category: {name: newname}}
      assert_response :redirect 
    end

    follow_redirect!
    assert_response :success

    assert_match newname, response.body

  end

  test "get new category form create non valid category" do
    get "/categories/new"
    assert_response :success

    newname = "Ha"

    assert_no_difference 'Category.count'  do
      post categories_path, params: {category: {name: newname}}
    end


    assert_match "Couldn't save", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'

  end

end
