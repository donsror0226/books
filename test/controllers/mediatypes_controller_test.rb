require 'test_helper'

class MediatypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mediatype = mediatypes(:one)
  end

  test "should get index" do
    get mediatypes_url
    assert_response :success
  end

  test "should get new" do
    get new_mediatype_url
    assert_response :success
  end

  test "should create mediatype" do
    assert_difference('Mediatype.count') do
      post mediatypes_url, params: { mediatype: {  } }
    end

    assert_redirected_to mediatype_url(Mediatype.last)
  end

  test "should show mediatype" do
    get mediatype_url(@mediatype)
    assert_response :success
  end

  test "should get edit" do
    get edit_mediatype_url(@mediatype)
    assert_response :success
  end

  test "should update mediatype" do
    patch mediatype_url(@mediatype), params: { mediatype: {  } }
    assert_redirected_to mediatype_url(@mediatype)
  end

  test "should destroy mediatype" do
    assert_difference('Mediatype.count', -1) do
      delete mediatype_url(@mediatype)
    end

    assert_redirected_to mediatypes_url
  end
end
