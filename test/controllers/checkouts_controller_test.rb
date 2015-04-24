require 'test_helper'

class CheckoutsControllerTest < ActionController::TestCase
  setup do
    @checkout = checkouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkout" do
    assert_difference('Checkout.count') do
      post :create, checkout: { checkin_id: @checkout.checkin_id, dateOut: @checkout.dateOut, destination: @checkout.destination, dispatchedBy: @checkout.dispatchedBy, purpose: @checkout.purpose, receivedBy: @checkout.receivedBy, serial_no: @checkout.serial_no, state: @checkout.state, waybillNo: @checkout.waybillNo }
    end

    assert_redirected_to checkout_path(assigns(:checkout))
  end

  test "should show checkout" do
    get :show, id: @checkout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkout
    assert_response :success
  end

  test "should update checkout" do
    patch :update, id: @checkout, checkout: { checkin_id: @checkout.checkin_id, dateOut: @checkout.dateOut, destination: @checkout.destination, dispatchedBy: @checkout.dispatchedBy, purpose: @checkout.purpose, receivedBy: @checkout.receivedBy, serial_no: @checkout.serial_no, state: @checkout.state, waybillNo: @checkout.waybillNo }
    assert_redirected_to checkout_path(assigns(:checkout))
  end

  test "should destroy checkout" do
    assert_difference('Checkout.count', -1) do
      delete :destroy, id: @checkout
    end

    assert_redirected_to checkouts_path
  end
end
