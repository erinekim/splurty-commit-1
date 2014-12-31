require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
	test "unique_tag" do  
		quote = FactoryGirl.create(:quote, :author => 'Oscar Wilde')
		expected = 'OW#' + quote.id.to_s
		actual = quote.unique_tag
		assert_equal expected, actual
	end

	test "generate slug" do
		q = Quote.new(:author => 'Oscar Wilde', :saying => "blah blah I don't know what to write I'm a poet")
		slug = q.generate_slug
		expected = "oscar-wilde-blah-blah-i-dont"
		assert_equal expected, slug 
	end

	test "q.save" do
		q = Quote.new(:author => 'Oscar Wilde', :saying => "blah blah I don't know what to write I'm a poet")
		q.save
		expected = "oscar-wilde-blah-blah-i-dont"
		# q.reload 
		assert_equal expected, q.slug
	end

end
