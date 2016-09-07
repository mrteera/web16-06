require 'test_helper'

class AllquotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allquotation = allquotations(:one)
  end

  test "should get index" do
    get allquotations_url
    assert_response :success
  end

  test "should get new" do
    get new_allquotation_url
    assert_response :success
  end

  test "should create allquotation" do
    assert_difference('Allquotation.count') do
      post allquotations_url, params: { allquotation: { author: @allquotation.author, categories_id: @allquotation.categories_id, quote: @allquotation.quote } }
    end

    assert_redirected_to allquotation_url(Allquotation.last)
  end

  test "should show allquotation" do
    get allquotation_url(@allquotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_allquotation_url(@allquotation)
    assert_response :success
  end

  test "should update allquotation" do
    patch allquotation_url(@allquotation), params: { allquotation: { author: @allquotation.author, categories_id: @allquotation.categories_id, quote: @allquotation.quote } }
    assert_redirected_to allquotation_url(@allquotation)
  end

  test "should destroy allquotation" do
    assert_difference('Allquotation.count', -1) do
      delete allquotation_url(@allquotation)
    end

    assert_redirected_to allquotations_url
  end
end
