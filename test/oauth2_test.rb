require File.expand_path("../test_helper", __FILE__)

class OAuth2Test < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
	end
	
	def test_initializing
		assert_equal Maventa::Client, @client.class
		assert_equal Maventa::OAuth2, @client.oauth2.class
	end
	
	def test_oauth2_get_token_invalid_credentials
		VCR.use_cassette("oauth2_get_token_invalid_credentials") do
			error = assert_raises Maventa::RequestError do
				response = @client.oauth2.token
			end
			assert_equal "invalid_credentials", error.code
		end
	end
	
	def test_oauth2_get_token
		VCR.use_cassette("oauth2") do
			response = @client.oauth2.token
			assert_kind_of Maventa::AccessToken, response
		end
	end
end
