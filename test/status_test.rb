require File.expand_path("../test_helper", __FILE__)

class StatusTest < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
	end
	
	def test_authenticated
		VCR.use_cassette("status") do
			@client.authorize
			response = @client.status.authenticated
			assert_kind_of Hash, response
			assert_equal ["client_id", "expires_at"], response.keys
		end
	end
end
