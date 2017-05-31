require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { address1: @listing.address1, address2: @listing.address2, content: @listing.content, country: @listing.country, currency: @listing.currency, instant_book: @listing.instant_book, max_guest: @listing.max_guest, name: @listing.name, no_bed: @listing.no_bed, no_room: @listing.no_room, pets: @listing.pets, postalcode: @listing.postalcode, price_per_day: @listing.price_per_day, property_type: @listing.property_type, smoker: @listing.smoker, state: @listing.state, user: @listing.user } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { address1: @listing.address1, address2: @listing.address2, content: @listing.content, country: @listing.country, currency: @listing.currency, instant_book: @listing.instant_book, max_guest: @listing.max_guest, name: @listing.name, no_bed: @listing.no_bed, no_room: @listing.no_room, pets: @listing.pets, postalcode: @listing.postalcode, price_per_day: @listing.price_per_day, property_type: @listing.property_type, smoker: @listing.smoker, state: @listing.state, user: @listing.user } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
