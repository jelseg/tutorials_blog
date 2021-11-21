require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end

  test "should show category listing page" do
    get "/categories"
    assert_select "a[href=?]", category_path(@category), text: @category.name #search for link that matches the link of category_path, with as text the name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

end
