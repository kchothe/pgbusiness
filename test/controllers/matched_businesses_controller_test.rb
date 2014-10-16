require 'test_helper'

class MatchedBusinessesControllerTest < ActionController::TestCase
  setup do
    @matched_business = matched_businesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matched_businesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matched_business" do
    assert_difference('MatchedBusiness.count') do
      post :create, matched_business: { CreatedBy: @matched_business.CreatedBy, CreatedDate: @matched_business.CreatedDate, IsRecommended: @matched_business.IsRecommended, ModifiedBy: @matched_business.ModifiedBy, ModifiedDate: @matched_business.ModifiedDate, business_id: @matched_business.business_id, contact_phone_id: @matched_business.contact_phone_id }
    end

    assert_redirected_to matched_business_path(assigns(:matched_business))
  end

  test "should show matched_business" do
    get :show, id: @matched_business
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matched_business
    assert_response :success
  end

  test "should update matched_business" do
    patch :update, id: @matched_business, matched_business: { CreatedBy: @matched_business.CreatedBy, CreatedDate: @matched_business.CreatedDate, IsRecommended: @matched_business.IsRecommended, ModifiedBy: @matched_business.ModifiedBy, ModifiedDate: @matched_business.ModifiedDate, business_id: @matched_business.business_id, contact_phone_id: @matched_business.contact_phone_id }
    assert_redirected_to matched_business_path(assigns(:matched_business))
  end

  test "should destroy matched_business" do
    assert_difference('MatchedBusiness.count', -1) do
      delete :destroy, id: @matched_business
    end

    assert_redirected_to matched_businesses_path
  end
end
