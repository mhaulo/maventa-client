require File.expand_path("../test_helper", __FILE__)

class JwkTest < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
	end
	
	# def test_jwk
	# 	VCR.use_cassette("jwk") do
	# 		@client.authorize
	# 		response = @client.jwk.list
	# 		assert_kind_of Hash, response
	# 	end
	# end
end
