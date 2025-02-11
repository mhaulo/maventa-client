require File.expand_path("../test_helper", __FILE__)

class ServicesTest < Minitest::Test
	def setup
		@client = Maventa::Client.new(mode: :testing)
	end
	
	def test_list_atg_agreements
		VCR.use_cassette("services") do
			@client.authorize
			response = @client.services.list_atg_agreements
			assert_kind_of Array, response
		end
	end
	
	def test_list_detect_checks
		VCR.use_cassette("services") do
			@client.authorize
			response = @client.services.list_detect_checks
			assert_kind_of Hash, response
		end
	end
end
