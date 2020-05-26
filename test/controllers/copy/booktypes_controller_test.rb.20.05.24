require 'test_helper'

class BooktypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booktype = booktypes(:one)
  end

  test "should get index" do
    get booktypes_url
    assert_response :success
  end

  test "should get new" do
    get new_booktype_url
    assert_response :success
  end

  test "should create booktype" do
    assert_difference('Booktype.count') do
      post booktypes_url, params: { booktype: {  } }
    end

    assert_redirected_to booktype_url(Booktype.last)
  end

  test "should show booktype" do
    get booktype_url(@booktype)
    assert_response :success
  end

  test "should get edit" do
    get edit_booktype_url(@booktype)
    assert_response :success
  end

  test "should update booktype" do
    patch booktype_url(@booktype), params: { booktype: {  } }
    assert_redirected_to booktype_url(@booktype)
  end

  test "should destroy booktype" do
    assert_difference('Booktype.count', -1) do
      delete booktype_url(@booktype)
    end

    assert_redirected_to booktypes_url
  end
end
