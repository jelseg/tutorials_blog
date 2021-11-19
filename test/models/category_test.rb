require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @category = Category.new(name: "Sports")
  end

  test "category valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ""
    assert_not @category.valid? #not -> should not be valid
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be to long" do
    @category.name = "haleluhamotherfuckers"
    assert_not @category.valid?
  end

  test "name should not be to short" do
    @category.name = "hi"
    assert_not @category.valid?
  end

end