require 'test_helper'

class OrdenationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordenation = ordenations(:one)
  end

  test "should get index" do
    get ordenations_url
    assert_response :success
  end

  test "should get new" do
    get new_ordenation_url
    assert_response :success
  end

  test "should create ordenation" do
    assert_difference('Ordenation.count') do
      post ordenations_url, params: { ordenation: { configuration_id: @ordenation.configuration_id, direction: @ordenation.direction, field: @ordenation.field, priority: @ordenation.priority } }
    end

    assert_redirected_to ordenation_url(Ordenation.last)
  end

  test "should show ordenation" do
    get ordenation_url(@ordenation)
    assert_response :success
  end

  test "should get edit" do
    get edit_ordenation_url(@ordenation)
    assert_response :success
  end

  test "should update ordenation" do
    patch ordenation_url(@ordenation), params: { ordenation: { configuration_id: @ordenation.configuration_id, direction: @ordenation.direction, field: @ordenation.field, priority: @ordenation.priority } }
    assert_redirected_to ordenation_url(@ordenation)
  end

  test "should destroy ordenation" do
    assert_difference('Ordenation.count', -1) do
      delete ordenation_url(@ordenation)
    end

    assert_redirected_to ordenations_url
  end
end
