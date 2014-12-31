require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quotes show page" do
     quote = Quote.create(:author => 'Ken Mazaika', :saying => 'You only yolo once.')
     get :show, :id => quote.id
   end

  test "quote show page, not found" do
  	get :show, :id => 'BLAH' 
  	assert_response :not_found
  end 
end
